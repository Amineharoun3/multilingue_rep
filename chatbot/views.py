from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
from .chatbot_logic import process_chatbot_response

@csrf_exempt
def chatbot(request):
    if request.method == 'POST':
        # Assurez-vous que le corps de la requête AJAX ou le formulaire contient 'user_input'
        user_input = request.POST.get('user_input', '')
        response = process_chatbot_response(user_input)
        # Retourner une JsonResponse est utile si vous utilisez AJAX pour la soumission du formulaire
        return JsonResponse({'response': response})
    elif request.method == 'GET':
        # Rendre le formulaire disponible pour les requêtes GET
        return render(request, 'chat.html')
    else:
        # Gestion des autres méthodes HTTP non autorisées
        return JsonResponse({'error': 'Only GET and POST requests are allowed.'}, status=405)
