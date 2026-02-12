class SentimentService {
    // Palabras clave para ESTRÉS -> Alto valor = Mal
    static final _stressKeyWords = {
        'horrible': 9.0, 'pésimo': 9.0, 'ansiedad': 8.0, 'miedo': 8.0,
        'tráfico': 7.0, 'gritos': 8.0, 'urgente': 7.0, 'cansado': 5.0,
        'tranquilo': 2.0, 'paz': 1.0, 'relajado': 1.0, 'bien': 3.0,
    };

    static final _energyKeywords = {
        'correr': 9.0, 'emocionado': 9.0, 'fuerte': 8.0, 'motivado': 8.0,
        'activo': 7.0, 'despierto': 7.0,
        'sueño': 2.0, 'agotado': 1.0, 'muerto': 1.0, 'pereza': 2.0, 'lento': 3.0,
    };

    /// Analiza el texto y devuelve un mapa
    /// SI no encuentra nada, devuelve null para no afectar sliders manualmente

    static final _negations = {'no', 'nunca', 'jamás', 'sin', 'poco'};

    Map<String, double>? analyzeText(String text) {
        if (text.isEmpty) return null;

        List<double> stressValues = [];
        List<double> energyValues = [];
        
        final lowerText = text.toLowerCase();
        // Remove punctuation to handle "no," correctly
        final cleanText = lowerText.replaceAll(RegExp(r'[.,;!¡?¿]'), ''); 
        final words = cleanText.split(RegExp(r'\s+'));

        for (int i = 0; i < words.length; i++) {
            final word = words[i];
            bool isNegated = false;

            // Miramos hasta 3 palabras atrás (ej: "NO tengo miedo")
            for (int k = 1; k <= 3; k++) {
                if (i - k >= 0) {
                    final prev = words[i - k];
                    if (_negations.contains(prev)) {
                        isNegated = true;
                        break;
                    }
                }
            }

            _stressKeyWords.forEach((key, value) {
                if (word.contains(key)) {
                    stressValues.add(isNegated ? (11.0 - value).clamp(1.0, 10.0) : value);
                }
            });

            _energyKeywords.forEach((key, value) {
                if (word.contains(key)) {
                    energyValues.add(isNegated ? (11.0 - value).clamp(1.0, 10.0) : value);
                }
            });
        }

        if (stressValues.isEmpty && energyValues.isEmpty) return null;

        double _average(List<double> values) {
            if (values.isEmpty) return 0.0;
            return values.reduce((a, b) => a + b) / values.length;
        }

        return {
            if (stressValues.isNotEmpty) 'stress' : _average(stressValues),
            if (energyValues.isNotEmpty) 'energy' : _average(energyValues),
        };
    }
}