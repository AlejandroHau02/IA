from fastapi import FastAPI
from pydantic import BaseModel
from logic import analyze_emotion #Lógica creada

app = FastAPI(
    title="Emotional Analysis API",
    description="Bakend minimalista.",
    version="1.0.0"
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