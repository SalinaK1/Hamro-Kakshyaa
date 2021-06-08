from django.urls import path 
from .views import *

urlpatterns =[
    path('',ListNotes.as_view()),
    path('<int:pk>/',DetailNotes.as_view()),
    path('upload/',UploadView.as_view(),name='UloadFiles')
]
 