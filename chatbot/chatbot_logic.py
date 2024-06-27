import nltk
from nltk.tokenize import word_tokenize

import spacy

# Charger le modèle de langue anglais de spaCy
nlp = spacy.load('en_core_web_sm')

def process_chatbot_response(user_input):
    # Utiliser spaCy pour analyser l'entrée de l'utilisateur
    doc = nlp(user_input)

    # Exemple de détection d'intention (salutations)
    for token in doc:
        if token.text.lower() in ['hello', 'hi', 'hey', 'greetings']:
            return "Hello there! How can I assist you today?"

    # Autres exemples de détection d'intentions peuvent être ajoutés ici

    # Réponse par défaut si aucune intention n'est détectée
    return "I'm sorry, I didn't quite catch that. Could you please rephrase?"
