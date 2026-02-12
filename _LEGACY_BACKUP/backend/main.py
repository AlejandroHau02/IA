from fastapi import FastAPI, Request, Response
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse
from pydantic import BaseModel
from logic import analyze_emotion
import os

app = FastAPI(
    title="Emotional Analysis API",
    description="Backend minimalista + Frontend Serving",
    version="1.0.0"
)

# Configurar CORS (Aunque al servir desde el mismo origen ya no es crítico, lo dejamos por si acaso)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=False,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Modelo de datos
class EmotionInput(BaseModel):
    text: str

@app.post("/analyze")
async def analyze_endpoint(input_data: EmotionInput):
    result = analyze_emotion(input_data.text)
    return result

@app.get("/health")
async def health_check():
    return {"status": "ok", "message": "Brain is running"}

# --- SERVING FRONTEND (Flutter Web) ---
# Ruta absoluta a la carpeta build/web de Flutter
frontend_path = os.path.abspath(os.path.join(os.path.dirname(__file__), "../mobile/build/web"))

# Verificar si existe el build antes de montarlo
if os.path.exists(frontend_path):
    # Montar TODO el build en la raíz "/"
    # html=True permite que si pides "/", te sirva "index.html" automáticamente
    app.mount("/", StaticFiles(directory=frontend_path, html=True), name="flutter")
else:
    @app.get("/")
    async def read_root():
        return {"message": "Frontend no encontrado. Ejecuta 'flutter build web' en /mobile"}