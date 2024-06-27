from django.shortcuts import render
from .models import Article
from django.utils.translation import gettext as _
from django.shortcuts import render

def home(request):
    return render(request, 'main/index.html')


def my_view(request):
    output_message = _("Welcome to our site!")
    return HttpResponse(output_message)


def article_list(request):
    articles = Article.objects.all()
    return render(request, 'article_list.html', {'articles': articles})


def help_page(request):
    return render(request, 'help.html')