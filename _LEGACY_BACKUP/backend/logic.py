from typing import Dict, Any

# Definir "Diccionario de prueba"
KEYWORDS_STRESS = ["estres", "estrés", "ansiedad", "pánico", "miedo", "agobiado", "colapso", "urgente"]
KEYWORDS_LOW_ENERGY = ["cansado", "agotado", "sueño", "aburrido", "triste", "depre", "bajón"]
KEYWORDS_HIGH_ENERGY = ["euforico", "feliz", "contento", "motivado", "activo", "genial", "emocionado"]

def analyze_emotion(text: str) -> Dict[str, Any]:
    text_lower = text.lower()

    # Puntuación simple (fase 1)
    stress_score = sum(1 for word in KEYWORDS_STRESS if word in text_lower)
    low_energy_score = sum(1 for word in KEYWORDS_LOW_ENERGY if word in text_lower)
    high_energy_score = sum(1 for word in KEYWORDS_HIGH_ENERGY if word in text_lower)
    
    # Lógica de decisión básica
    if stress_score > 0:
        return {
            "emotion": "Estrés / Ansiedad",
            "music_category": "Ambient / Lo-Fi Beats",
            "why": "El ritmo lento y repetitivo del Lo-Fi ayuda a sincronizar tus ondas cerebrales y reducir el cortisol.",
            "action": "Respiración 4-7-8 (Inhala 4, Retén 7, Exhala 8)",
            "type": "breathing",
            "pattern": {"inhale": 4, "hold": 7, "exhale": 8, "color": 0xFF6A1B9A} 
        }
    elif low_energy_score > 0:
        return {
            "emotion": "Baja Energía / Cansancio",
            "music_category": "Acoustic / Piano Suave",
            "why": "Necesitas oxígeno para despertar tu cerebro.",
            "action": "Respiración Energizante (4-4)",
            "type": "breathing",
            "pattern": {"inhale": 4, "hold": 0, "exhale": 4, "color": 0xFFFFD740} 
        }
    elif high_energy_score > 0:
        return {
            "emotion": "Alta Energía / Felicidad",
            "music_category": "Upbeat / Funk / Pop",
            "why": "Aprovecha este pico de dopamina.",
            "action": "Escribir ideas",
            "type": "journaling"
        }
    
    # CASO POR DEFECTO (Si no se detecta nada)
    return {
        "emotion": "Neutral / Calma",
        "music_category": "Jazz / Lofi / Nature Sounds",
        "why": "Pareces estar en equilibrio. Un poco de música ambiental puede ayudarte a mantener el flujo.",
        "action": "Continúa con lo que estás haciendo",
        "type": "neutral"
    }