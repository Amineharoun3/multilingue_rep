"""
URL configuration for multilang_site project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import include, path
from main import views
from chatbot.views import chatbot


urlpatterns = [
 path('admin/', admin.site.urls),
    path('article/', views.article_list, name='article_list'),  # Ajout du slash
    path('main/home/', views.home, name='home'),  # Ajout du slash
    path('i18n/', include('django.conf.urls.i18n')),
    path('chat/', chatbot, name='chatbot'),  # Correction ici, ajout du slash et nom
    path('help/', views.help_page, name='help'),
]
