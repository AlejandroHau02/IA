from typing import Dict, Any

# Definir "Diccionario de prueba"
KEYWORDS_STRESS = ["estres", "ansiedad", "pánico", "miedo", "agobiado", "colapso", "urgente"]
KEYWORDS_LOW_ENERGY = ["cansado", "agotado", "sueño", "aburrido", "triste", "depre", "bajón"]
KEYWORDS_HIGH_ENERGY = ["euforico", "feliz", "contento", "motivado", "activo", "genial"]

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
            "action": "Respiración 4-7-8 (Inhala 4, Retén 7, Exhala 8)"
        }
    elif low_energy_score > 0:
        return {
            "emotion": "Baja Energía / Cansancio",
            "music_category": "Acoustic / Piano Suave",
            "action": "Pequeño estiramiento de cuerpo o caminar"
        }
    elif high_energy_score > 0:
        return {
            "emotion": "Alta Energía / Felicidad",
            "music_category": "Upbeat / Funk / Pop",
            "action": "Aprovecha para escribir 3 ideas o agradecimientos"
        }
    else:
        return {
            "emotion": "Neutral / Calma",
            "music_category": "Classical / Instrumental",
            "action": "Tómate un minuto de silencio consciente"
        }
