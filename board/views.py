from django.shortcuts import render
from .models import Article

def index(request):
    articles = Article.objects.all()
    return render(request, 'board/index.html', {
        'articles': articles
    })