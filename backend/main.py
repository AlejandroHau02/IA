from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from logic import analyze_emotion # Lógica creada

app = FastAPI(
    title="Emotional Analysis API",
    description="Backend minimalista.",
    version="1.0.0"
)

# Configurar CORS (Permitir que la app web hable con el backend)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # En producción esto se restringe, pero para dev está bien
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Modelo de datos para validar la entrada
class EmotionInput(BaseModel):
    text: str

@app.get("/")
async def root():
    return {"message": "API activa"}

@app.post("/analyze")
async def analyze_endpoint(input_data: EmotionInput):
    # Usamos la función de lógica
    result = analyze_emotion(input_data.text)
    return result