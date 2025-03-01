from django.urls import path

from .views import (
    CustomTokenObtainPairView,
    LogoutView,
    RegisterUserView,
    UserDetailView,
    UserListView,
)

urlpatterns = [
    path("register/", RegisterUserView.as_view(), name="register"),
    path("users/", UserListView.as_view(), name="users"),
    path("users/<int:id>/", UserDetailView.as_view(), name="user-detail"),
    path("login/", CustomTokenObtainPairView.as_view(), name="login"),
    path("logout/", LogoutView.as_view(), name="logout"),
]
