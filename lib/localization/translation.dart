import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../utils/app_string.dart';

class AppTranslation extends Translations {
  static final fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      "noData": "No Data found",
      "noInternet": "No Internet",
      "checkInternet": "Check Internet",
      "back": "Back",
      "youSureWantToLogout": "You sure want to logout",
      "no": "No",
      "yes": "Yes",
      "areYouSure": "Are you sure",
      "enterYouPassword": "Enter you password",
      "cancel": "Cancel",
      "done": "Done",
      "deleteDetails": "All your changes will be deleted and you will no longer be able to access them.",
      "someThingWrong": "Some Thing Wrong",
      "orBoard1": "Let’s travel together",
      "orBoard2": "Find a ride",
      "orBoard3": "Post a ride",
      "orBoardList1": "Save money",
      "orBoardList2": "Make passive income",
      "orBoardList3": "Make new friends",
      "orBoardList4": "Overcome traffic congestion",
      "orBoard2List": "Request a ride and be picked up on the same route by the driver",
      "orBoard3List": "Publish a ride and pick up passengers along the way",
      "together": "Let’s travel together!",
      "signIn": "Sign in",
      "signUp": "Sign Up",
      "welcome": "Welcome!",
      "pleaseLogin": "Please Login in to continue our app",
      "pleaseSign": "Please Login in to continue our app",
      "email": "Email Address",
      "phone": "Phone Number",
      "enterEmail": "Enter your email",
      "enterFullName": "Enter your full name",
      "enterPhone": "Enter your phone",
      "remember": "Remember Me",
      "tryAgain": "Try Again",
      "phoneNumber": "Phone Number",
      "agreeTerms": "Agree With Terms and Conditions",
      "forgetText": "Please enter your email address which was used to create your account ",
      "emailText": "Please enter the 5 digit code that was sent to xyz@gmail.com ",
      "createPasswordText": "Please create and enter a new password for your account",
      "test": "Test",
      "changePassword": "Change Password",
      "currentPassword": "Current Password",
      "newPassword": "New Password",
      "confirmPassword": "Confirm Password",
      "forgotPassword": "Forgot Password",
      "enterOtp": "Enter OTP",
      "sendOtp": "Send OTP",
      "verifyOtp": "Verify OTP",
      "confirm": "Confirm",
      "save": "Save",
      "createNewPassword": "Create New Password",
      "createYourNewPassword": "Create Your New Password",
      "password": "Password",
      "continues": "Continue",
      "checkPricing": "Check pricing",
      "otpIsInValid": "Otp is inValid",
      "resendCode": "Resend Code",
      "resendCodeIn": "Resend code in",
      "minute": "minute",
      "verify": "Verify",
      "signInYourAccount": "Sign In Your Account",
      "forgotThePassword": "Forgot the password",
      "doNotHaveAccount": "Don’t have an account?",
      "alreadyHaveAccount": "Already have an account? ",
      "fullName": "Full Name",
      "createYourAccount": "Create Your Account",
      "otpVerify": "OTP Verify",
      "inbox": "Inbox",
      "searchDoctor": "search a doctor",
      "activeNow": "Active Now",
      "messageHere": "message here",
      "notifications": "Notifications",
      "signInWithPassword": "Sign in with password",
      "contact": "Contact",
      "dateOfBirth": "Date of birth",
      "age": "Age",
      "aboutMe": "About Me",
      "gender": "Gender",
      "profile": "Profile",
      "saveAndChanges": "Save and Changes",
      "editProfile": "Edit Profile",
      "settings": "Settings",
      "logOut": "Log Out",
      "privacyPolicy": "Privacy Policy",
      "deleteAccount": "Delete account",
      "termsOfServices": "Terms of Services",
      "noInternetConnection": "No internet connection",
      "badResponseRequest": "Bad Response Request",
      "requestTimeOut": "Request Time Out",
      "skip": "Skip",
      "next": "Next",
      "getStarted": "Get Started",
      "welcomeToTheRideShare": "Welcome to the ......",
      "safeAndSecureJourneys": "Safe and Secure Journeys.",
      "easyAndConvenientBooking": "Easy and Convenient Booking.",
      "seamlessAffordableAndReliableRideSharing": "Seamless, affordable, and reliable ride-sharing at your fingertips.",
      "yourSafetyIsOurTopPriorityEveryRideIsMonitored": "Your safety is our top priority. Every ride is monitored for your peace of mind.",
      "bookYourRideInJustAFewTaps": "Book your ride in just a few taps. Quick, easy, and hassle-free.",
      "orContinueWith": "or continue with",
      "enterYourEmailToReset": "Enter your email to reset your password.",
      "investSmarterWithHAVN": "Invest Smarter with HAVN",
      "accessDetailedPropertyAnalytics": "Access Detailed Property Analytics",
      "getMarketInsightsInstantly": "Get Market Insights Instantly",
      "personalizedFinancialProjections": "Personalized Financial Projections",
      "tryForFree": "Try For Free ( 3 Property Searches)",
      "noPaymentNow": "No Payment Now",
      "discoverYourNextInvestment": "Discover Your Next Investment",
      "searchAddressCityLocation": "Search Address, City, Location",
      "recentlyViewed": "Recently Viewed",
      "upgradePlan": "Upgrade Plan",
      "helpCenter": "Help Center",
      "feedBack": "Feedback",
      "requestFeature": "Request a Feature",
      "termsOfService": "Terms of Service",
      "update": "Update",
      "motoBike": "Moto Bike",
      "car": "Car",
      "schedule": "Schedule",
      "rentCar": "Rent Car",
      "takeRide": "Take a ride to",
      "searchDestination": "Search a destination",
      "home": "Home",
      "setAddress": "Set Address",
      "work": "Work",
      "multiplePromos": "You have multiple promos.",
      "termsApply": "Terms apply",
      "moreWayScope": "More ways to use Scoop",
      "passengerSafety": "Passenger’s safety",
      "firstClassRide": "Passenger’s safety",
      "onTripIssues": "On-trip help with safety issues",
      "topRated": "Top-rated drivers, newer cars",
      "yourLocation": "Your Location",
      "orderTracking": "Order Tracking",
      "requestHistory": "Request History",
      "safety": "Safety",
      "faq": "FAQ",
      "setLocation": "Set Location",
      "confirmHomeAddress": "Confirm Home Address",
      "confirmOfficeAddress": "Confirm Office Address",
      "choseBike": "Choose bike",
      "findingRide": "Finding nearby rides..",
      "nearbyRides": "We have sent your ride request to the nearby riders.",
      "yourTrip": "Your Trip",
      "cancelRide": "Cancel this ride?",
      "cardHolderName": "Enter card holder name",
      "cardHolderNumber": "Enter card holder number",
      "cvc": "CVV/CVC",
      "date": "CVV/CVC",
      "bookNow": "Book Now",
      "applySaved": "We’ll automatically apply them on that saved you.",
      "scheduleRide": "Schedule your ride.",
      "scheduleRideNext": "Schedule your next trip up to 60 days ago.",
      "name": "Name",
      "male": "Male",
      "female": "Female",
      "others": "Others",
      "address": "Address",
      "doYouWantToLogoutProfile": "Do you want to logout your profile?",
      "history": "History",
      "tripDetails": "Trip Details",
      "tripId": "Trip ID",
      "tripInfo": "Trip Info",
      "copy": "COPY",
      "receipt": "Receipt",
      "baseFare": "Base fare",
      "distance": "Distance",
      "time": "Time",
      "safetyFee": "Safety Coverage Fee",
      "subtotal": "Subtotal",
      "discount": "Discount",
      "netFare": "Net fare",
      "viewDetails": "View Details",
      "sendMessage": "Send a free message",
      "cancelNow": "Cancel Now",
      "pending": "Pending",
      "complete": "Completed",
      "offers": "Offers",
      "language": "Language",
      "changePasswords": "Change Password",
      "deleteAccounts": "Delete Account"
    },
    'fr_FR':{
      "noData": "Aucune donnée trouvée",
      "noInternet": "Pas d'internet",
      "checkInternet": "Vérifiez votre connexion Internet",
      "back": "Retour",
      "youSureWantToLogout": "Voulez-vous vraiment vous déconnecter ?",
      "no": "Non",
      "yes": "Oui",
      "areYouSure": "Êtes-vous sûr?",
      "enterYouPassword": "Entrez votre mot de passe",
      "cancel": "Annuler",
      "done": "Terminé",
      "deleteDetails": "Toutes vos modifications seront supprimées et vous ne pourrez plus y accéder.",
      "someThingWrong": "Quelque chose ne va pas",
      "orBoard1": "Voyageons ensemble",
      "orBoard2": "Trouver un trajet",
      "orBoard3": "Publier un trajet",
      "orBoardList1": "Économiser de l'argent",
      "orBoardList2": "Générez un revenu passif",
      "orBoardList3": "Faites de nouveaux amis",
      "orBoardList4": "Surmontez les embouteillages",
      "orBoard2List": "Demandez un trajet et soyez pris en charge par un conducteur sur le même itinéraire",
      "orBoard3List": "Publiez un trajet et prenez des passagers en cours de route",
      "together": "Voyageons ensemble !",
      "signIn": "Se connecter",
      "signUp": "S'inscrire",
      "welcome": "Bienvenue!",
      "pleaseLogin": "Veuillez vous connecter pour continuer à utiliser notre application",
      "pleaseSign": "Veuillez vous connecter pour continuer à utiliser notre application",
      "email": "Adresse e-mail",
      "phone": "Numéro de téléphone",
      "enterEmail": "Entrez votre e-mail",
      "enterFullName": "Entrez votre nom complet",
      "enterPhone": "Entrez votre numéro de téléphone",
      "remember": "Souviens-toi de moi",
      "tryAgain": "Réessayer",
      "phoneNumber": "Numéro de téléphone",
      "agreeTerms": "Accepter les termes et conditions",
      "forgetText": "Veuillez entrer votre adresse e-mail utilisée pour créer votre compte",
      "emailText": "Veuillez entrer le code à 5 chiffres envoyé à xyz@gmail.com",
      "createPasswordText": "Veuillez créer et entrer un nouveau mot de passe pour votre compte",
      "test": "Test",
      "changePassword": "Changer le mot de passe",
      "currentPassword": "Mot de passe actuel",
      "newPassword": "Nouveau mot de passe",
      "confirmPassword": "Confirmez le mot de passe",
      "forgotPassword": "Mot de passe oublié",
      "enterOtp": "Entrer OTP",
      "sendOtp": "Envoyer OTP",
      "verifyOtp": "Vérifier OTP",
      "confirm": "Confirmer",
      "save": "Sauvegarder",
      "createNewPassword": "Créer un nouveau mot de passe",
      "createYourNewPassword": "Créez votre nouveau mot de passe",
      "password": "Mot de passe",
      "continues": "Continuer",
      "checkPricing": "Vérifier les tarifs",
      "otpIsInValid": "OTP est invalide",
      "resendCode": "Renvoyer le code",
      "resendCodeIn": "Renvoyer le code dans",
      "minute": "minute",
      "verify": "Vérifier",
      "signInYourAccount": "Connectez-vous à votre compte",
      "forgotThePassword": "Mot de passe oublié",
      "doNotHaveAccount": "Vous n'avez pas de compte?",
      "alreadyHaveAccount": "Vous avez déjà un compte?",
      "fullName": "Nom complet",
      "createYourAccount": "Créez votre compte",
      "otpVerify": "Vérification OTP",
      "inbox": "Boîte de réception",
      "searchDoctor": "Rechercher un médecin",
      "activeNow": "Actif maintenant",
      "messageHere": "message ici",
      "notifications": "Notifications",
      "signInWithPassword": "Se connecter avec mot de passe",
      "contact": "Contact",
      "dateOfBirth": "Date de naissance",
      "age": "Âge",
      "aboutMe": "À propos de moi",
      "gender": "Genre",
      "profile": "Profil",
      "saveAndChanges": "Sauvegarder et modifier",
      "editProfile": "Modifier le profil",
      "settings": "Paramètres",
      "logOut": "Se déconnecter",
      "privacyPolicy": "Politique de confidentialité",
      "deleteAccount": "Supprimer le compte",
      "termsOfServices": "Conditions de service",
      "noInternetConnection": "Pas de connexion Internet",
      "badResponseRequest": "Mauvaise réponse de la requête",
      "requestTimeOut": "Délai de la requête dépassé",
      "skip": "Passer",
      "next": "Suivant",
      "getStarted": "Commencer",
      "welcomeToTheRideShare": "Bienvenue dans le ......",
      "safeAndSecureJourneys": "Voyages sûrs et sécurisés.",
      "easyAndConvenientBooking": "Réservation facile et pratique.",
      "seamlessAffordableAndReliableRideSharing": "Covoiturage fluide, abordable et fiable à portée de main.",
      "yourSafetyIsOurTopPriorityEveryRideIsMonitored": "Votre sécurité est notre priorité absolue. Chaque trajet est surveillé pour votre tranquillité d'esprit.",
      "bookYourRideInJustAFewTaps": "Réservez votre trajet en quelques clics. Rapide, facile et sans tracas.",
      "orContinueWith": "ou continuer avec",
      "enterYourEmailToReset": "Entrez votre e-mail pour réinitialiser votre mot de passe.",
      "investSmarterWithHAVN": "Investissez plus intelligemment avec HAVN",
      "accessDetailedPropertyAnalytics": "Accédez à des analyses immobilières détaillées",
      "getMarketInsightsInstantly": "Obtenez des informations sur le marché instantanément",
      "personalizedFinancialProjections": "Projections financières personnalisées",
      "tryForFree": "Essayer gratuitement (3 recherches de propriété)",
      "noPaymentNow": "Aucun paiement maintenant",
      "discoverYourNextInvestment": "Découvrez votre prochain investissement",
      "searchAddressCityLocation": "Rechercher une adresse, une ville, un lieu",
      "recentlyViewed": "Récemment consulté",
      "upgradePlan": "Mettre à niveau le plan",
      "helpCenter": "Centre d'aide",
      "feedBack": "Retour d'information",
      "requestFeature": "Demander une fonctionnalité",
      "termsOfService": "Conditions de service",
      "update": "Mise à jour",
      "motoBike": "Moto",
      "car": "Voiture",
      "schedule": "Planifier",
      "rentCar": "Louer une voiture",
      "takeRide": "Prenez un trajet jusqu’à",
      "searchDestination": "Rechercher une destination",
      "home": "Accueil",
      "setAddress": "Définir l'adresse",
      "work": "Travail",
      "multiplePromos": "Vous avez plusieurs promotions.",
      "termsApply": "Conditions applicables",
      "moreWayScope": "Plus de façons d'utiliser Scoop",
      "passengerSafety": "Sécurité du passager",
      "firstClassRide": "Sécurité du passager",
      "onTripIssues": "Aide en cours de trajet pour les problèmes de sécurité",
      "topRated": "Conducteurs les mieux notés, voitures plus récentes",
      "yourLocation": "Votre emplacement",
      "orderTracking": "Suivi de commande",
      "requestHistory": "Historique des demandes",
      "safety": "Sécurité",
      "faq": "FAQ",
      "setLocation": "Définir l'emplacement",
      "confirmHomeAddress": "Confirmer l'adresse du domicile",
      "confirmOfficeAddress": "Confirmer l'adresse du bureau",
      "choseBike": "Choisir une moto",
      "findingRide": "Recherche de trajets à proximité...",
      "nearbyRides": "Nous avons envoyé votre demande aux conducteurs à proximité.",
      "yourTrip": "Votre trajet",
      "cancelRide": "Annuler ce trajet ?",
      "cardHolderName": "Entrez le nom du titulaire de la carte",
      "cardHolderNumber": "Entrez le numéro de la carte",
      "cvc": "CVV/CVC",
      "date": "Date",
      "bookNow": "Réservez maintenant",
      "applySaved": "Nous les appliquerons automatiquement pour vous faire économiser.",
      "scheduleRide": "Planifiez votre trajet.",
      "scheduleRideNext": "Planifiez votre prochain trajet jusqu’à 60 jours à l’avance.",
      "name": "Nom",
      "male": "Homme",
      "female": "Femme",
      "others": "Autres",
      "address": "Adresse",
      "doYouWantToLogoutProfile": "Souhaitez-vous vous déconnecter de votre profil ?",
      "history": "Historique",
      "tripDetails": "Détails du trajet",
      "tripId": "ID du trajet",
      "tripInfo": "Infos du trajet",
      "copy": "COPIER",
      "receipt": "Reçu",
      "baseFare": "Tarif de base",
      "distance": "Distance",
      "time": "Temps",
      "safetyFee": "Frais de couverture sécurité",
      "subtotal": "Sous-total",
      "discount": "Remise",
      "netFare": "Tarif net",
      "viewDetails": "Voir les détails",
      "sendMessage": "Envoyer un message gratuit",
      "cancelNow": "Annuler maintenant",
      "pending": "En attente",
      "complete": "Terminé",
      "offers": "Offres",
      "language": "Langue",
      "changePasswords": "Changer le mot de passe",
      "deleteAccounts": "Supprimer le compte"
    },
    'es_ES':{
      "noData": "No se encontraron datos",
      "noInternet": "Sin internet",
      "checkInternet": "Verifique su conexión a Internet",
      "back": "Atrás",
      "youSureWantToLogout": "¿Seguro que quieres cerrar sesión?",
      "no": "No",
      "yes": "Sí",
      "areYouSure": "¿Estás seguro?",
      "enterYouPassword": "Ingresa tu contraseña",
      "cancel": "Cancelar",
      "done": "Hecho",
      "deleteDetails": "Todos tus cambios serán eliminados y ya no podrás acceder a ellos.",
      "someThingWrong": "Algo salió mal",
      "orBoard1": "Viajemos juntos",
      "orBoard2": "Buscar un viaje",
      "orBoard3": "Publicar un viaje",
      "orBoardList1": "Ahorrar dinero",
      "orBoardList2": "Generar ingresos pasivos",
      "orBoardList3": "Hacer nuevos amigos",
      "orBoardList4": "Superar la congestión del tráfico",
      "orBoard2List": "Solicita un viaje y el conductor te recogerá en la misma ruta",
      "orBoard3List": "Publica un viaje y recoge pasajeros en el camino",
      "together": "¡Viajemos juntos!",
      "signIn": "Iniciar sesión",
      "signUp": "Registrarse",
      "welcome": "¡Bienvenido!",
      "pleaseLogin": "Inicia sesión para continuar en nuestra app",
      "pleaseSign": "Inicia sesión para continuar en nuestra app",
      "email": "Correo electrónico",
      "phone": "Número de teléfono",
      "enterEmail": "Introduce tu correo electrónico",
      "enterFullName": "Introduce tu nombre completo",
      "enterPhone": "Introduce tu número de teléfono",
      "remember": "Recuérdame",
      "tryAgain": "Intentar de nuevo",
      "phoneNumber": "Número de teléfono",
      "agreeTerms": "Aceptar términos y condiciones",
      "forgetText": "Por favor ingresa el correo electrónico con el que creaste tu cuenta",
      "emailText": "Ingresa el código de 5 dígitos enviado a xyz@gmail.com",
      "createPasswordText": "Por favor crea e ingresa una nueva contraseña para tu cuenta",
      "test": "Prueba",
      "changePassword": "Cambiar contraseña",
      "currentPassword": "Contraseña actual",
      "newPassword": "Nueva contraseña",
      "confirmPassword": "Confirmar contraseña",
      "forgotPassword": "Olvidé mi contraseña",
      "enterOtp": "Ingresa el OTP",
      "sendOtp": "Enviar OTP",
      "verifyOtp": "Verificar OTP",
      "confirm": "Confirmar",
      "save": "Guardar",
      "createNewPassword": "Crear nueva contraseña",
      "createYourNewPassword": "Crea tu nueva contraseña",
      "password": "Contraseña",
      "continues": "Continuar",
      "checkPricing": "Consultar precios",
      "otpIsInValid": "El OTP no es válido",
      "resendCode": "Reenviar código",
      "resendCodeIn": "Reenviar código en",
      "minute": "minuto",
      "verify": "Verificar",
      "signInYourAccount": "Inicia sesión en tu cuenta",
      "forgotThePassword": "¿Olvidaste tu contraseña?",
      "doNotHaveAccount": "¿No tienes una cuenta?",
      "alreadyHaveAccount": "¿Ya tienes una cuenta?",
      "fullName": "Nombre completo",
      "createYourAccount": "Crea tu cuenta",
      "otpVerify": "Verificación OTP",
      "inbox": "Bandeja de entrada",
      "searchDoctor": "buscar un médico",
      "activeNow": "Activo ahora",
      "messageHere": "mensaje aquí",
      "notifications": "Notificaciones",
      "signInWithPassword": "Iniciar sesión con contraseña",
      "contact": "Contacto",
      "dateOfBirth": "Fecha de nacimiento",
      "age": "Edad",
      "aboutMe": "Sobre mí",
      "gender": "Género",
      "profile": "Perfil",
      "saveAndChanges": "Guardar y aplicar cambios",
      "editProfile": "Editar perfil",
      "settings": "Configuraciones",
      "logOut": "Cerrar sesión",
      "privacyPolicy": "Política de privacidad",
      "deleteAccount": "Eliminar cuenta",
      "termsOfServices": "Términos del servicio",
      "noInternetConnection": "Sin conexión a Internet",
      "badResponseRequest": "Solicitud con respuesta errónea",
      "requestTimeOut": "Tiempo de solicitud agotado",
      "skip": "Saltar",
      "next": "Siguiente",
      "getStarted": "Empezar",
      "welcomeToTheRideShare": "Bienvenido a ......",
      "safeAndSecureJourneys": "Viajes seguros y protegidos.",
      "easyAndConvenientBooking": "Reserva fácil y conveniente.",
      "seamlessAffordableAndReliableRideSharing": "Viajes compartidos accesibles, fiables y sin complicaciones al alcance de tu mano.",
      "yourSafetyIsOurTopPriorityEveryRideIsMonitored": "Tu seguridad es nuestra máxima prioridad. Cada viaje es monitoreado para tu tranquilidad.",
      "bookYourRideInJustAFewTaps": "Reserva tu viaje con solo unos toques. Rápido, fácil y sin complicaciones.",
      "orContinueWith": "o continuar con",
      "enterYourEmailToReset": "Introduce tu correo electrónico para restablecer tu contraseña.",
      "investSmarterWithHAVN": "Invierte inteligentemente con HAVN",
      "accessDetailedPropertyAnalytics": "Accede a análisis detallados de propiedades",
      "getMarketInsightsInstantly": "Obtén información del mercado al instante",
      "personalizedFinancialProjections": "Proyecciones financieras personalizadas",
      "tryForFree": "Prueba gratis (3 búsquedas de propiedades)",
      "noPaymentNow": "Sin pago ahora",
      "discoverYourNextInvestment": "Descubre tu próxima inversión",
      "searchAddressCityLocation": "Buscar dirección, ciudad, ubicación",
      "recentlyViewed": "Visto recientemente",
      "upgradePlan": "Actualizar plan",
      "helpCenter": "Centro de ayuda",
      "feedBack": "Comentarios",
      "requestFeature": "Solicitar una función",
      "termsOfService": "Términos del servicio",
      "update": "Actualizar",
      "motoBike": "Moto",
      "car": "Coche",
      "schedule": "Programar",
      "rentCar": "Alquilar coche",
      "takeRide": "Tomar un viaje a",
      "searchDestination": "Buscar un destino",
      "home": "Casa",
      "setAddress": "Establecer dirección",
      "work": "Trabajo",
      "multiplePromos": "Tienes múltiples promociones.",
      "termsApply": "Se aplican términos",
      "moreWayScope": "Más formas de usar Scoop",
      "passengerSafety": "Seguridad del pasajero",
      "firstClassRide": "Viaje de primera clase",
      "onTripIssues": "Ayuda con problemas de seguridad durante el viaje",
      "topRated": "Conductores mejor calificados, autos más nuevos",
      "yourLocation": "Tu ubicación",
      "orderTracking": "Seguimiento de pedido",
      "requestHistory": "Historial de solicitudes",
      "safety": "Seguridad",
      "faq": "Preguntas frecuentes",
      "setLocation": "Establecer ubicación",
      "confirmHomeAddress": "Confirmar dirección de casa",
      "confirmOfficeAddress": "Confirmar dirección de oficina",
      "choseBike": "Elegir moto",
      "findingRide": "Buscando viajes cercanos...",
      "nearbyRides": "Hemos enviado tu solicitud de viaje a los conductores cercanos.",
      "yourTrip": "Tu viaje",
      "cancelRide": "¿Cancelar este viaje?",
      "cardHolderName": "Introduce el nombre del titular de la tarjeta",
      "cardHolderNumber": "Introduce el número de la tarjeta",
      "cvc": "CVV/CVC",
      "date": "CVV/CVC",
      "bookNow": "Reservar ahora",
      "applySaved": "Aplicaremos automáticamente las promociones guardadas.",
      "scheduleRide": "Programa tu viaje.",
      "scheduleRideNext": "Programa tu próximo viaje hasta con 60 días de anticipación.",
      "name": "Nombre",
      "male": "Hombre",
      "female": "Mujer",
      "others": "Otros",
      "address": "Dirección",
      "doYouWantToLogoutProfile": "¿Deseas cerrar sesión en tu perfil?",
      "history": "Historial",
      "tripDetails": "Detalles del viaje",
      "tripId": "ID del viaje",
      "tripInfo": "Información del viaje",
      "copy": "COPIAR",
      "receipt": "Recibo",
      "baseFare": "Tarifa base",
      "distance": "Distancia",
      "time": "Tiempo",
      "safetyFee": "Tarifa de cobertura de seguridad",
      "subtotal": "Subtotal",
      "discount": "Descuento",
      "netFare": "Tarifa neta",
      "viewDetails": "Ver detalles",
      "sendMessage": "Enviar mensaje gratis",
      "cancelNow": "Cancelar ahora",
      "pending": "Pendiente",
      "complete": "Completado",
      "offers": "Ofertas",
      "language": "Idioma",
      "changePasswords": "Cambiar contraseña",
      "deleteAccounts": "Eliminar cuenta"
    },
    'ht_HT':{
      "noData": "Pa gen done",
      "noInternet": "Pa gen Entènèt",
      "checkInternet": "Tcheke koneksyon Entènèt la",
      "back": "Retounen",
      "youSureWantToLogout": "Eske ou sèten ou vle dekonekte?",
      "no": "Non",
      "yes": "Wi",
      "areYouSure": "Eske ou sèten?",
      "enterYouPassword": "Antre modpas ou",
      "cancel": "Anile",
      "done": "Fè",
      "deleteDetails": "Tout chanjman ou yo ap efase e ou pap ka jwenn aksè ankò.",
      "someThingWrong": "Gen yon erè",
      "orBoard1": "Ann vwayaje ansanm",
      "orBoard2": "Chèche yon woulib",
      "orBoard3": "Pibliye yon woulib",
      "orBoardList1": "Ekonomize lajan",
      "orBoardList2": "Fè revni pasif",
      "orBoardList3": "Fè nouvo zanmi",
      "orBoardList4": "Evite trafik",
      "orBoard2List": "Mande yon woulib epi chofè a vin chèche ou sou wout la",
      "orBoard3List": "Pibliye yon woulib epi pran pasaje sou wout la",
      "together": "Ann vwayaje ansanm!",
      "signIn": "Konekte",
      "signUp": "Enskri",
      "welcome": "Byenveni!",
      "pleaseLogin": "Tanpri konekte pou kontinye itilize aplikasyon an",
      "pleaseSign": "Tanpri konekte pou kontinye itilize aplikasyon an",
      "email": "Adrès imel",
      "phone": "Nimewo telefòn",
      "enterEmail": "Antre imel ou",
      "enterFullName": "Antre non konplè ou",
      "enterPhone": "Antre nimewo telefòn ou",
      "remember": "Sonje mwen",
      "tryAgain": "Eseye ankò",
      "phoneNumber": "Nimewo telefòn",
      "agreeTerms": "Dakò ak tèm ak kondisyon yo",
      "forgetText": "Tanpri antre adrès imel ou te itilize pou kreye kont ou",
      "emailText": "Tanpri antre kòd 5 chif la yo te voye bay xyz@gmail.com",
      "createPasswordText": "Tanpri kreye epi antre yon nouvo modpas pou kont ou",
      "test": "Tès",
      "changePassword": "Chanje modpas",
      "currentPassword": "Modpas aktyèl",
      "newPassword": "Nouvo modpas",
      "confirmPassword": "Konfime modpas",
      "forgotPassword": "Bliye modpas",
      "enterOtp": "Antre OTP",
      "sendOtp": "Voye OTP",
      "verifyOtp": "Verifye OTP",
      "confirm": "Konfime",
      "save": "Sove",
      "createNewPassword": "Kreye nouvo modpas",
      "createYourNewPassword": "Kreye nouvo modpas ou",
      "password": "Modpas",
      "continues": "Kontinye",
      "checkPricing": "Tcheke pri yo",
      "otpIsInValid": "OTP la pa valab",
      "resendCode": "Revòye kòd la",
      "resendCodeIn": "Revòye kòd la nan",
      "minute": "minit",
      "verify": "Verifye",
      "signInYourAccount": "Konekte sou kont ou",
      "forgotThePassword": "Bliye modpas la",
      "doNotHaveAccount": "Pa gen kont?",
      "alreadyHaveAccount": "Ou deja gen kont? ",
      "fullName": "Non konplè",
      "createYourAccount": "Kreye kont ou",
      "otpVerify": "Verifye OTP",
      "inbox": "Bwat resepsyon",
      "searchDoctor": "chèche yon doktè",
      "activeNow": "Aktif kounye a",
      "messageHere": "ekri mesaj la isit la",
      "notifications": "Notifikasyon",
      "signInWithPassword": "Konekte ak modpas",
      "contact": "Kontak",
      "dateOfBirth": "Dat nesans",
      "age": "Laj",
      "aboutMe": "Sou mwen",
      "gender": "Sèks",
      "profile": "Pwofil",
      "saveAndChanges": "Sove ak chanjman",
      "editProfile": "Modifye pwofil",
      "settings": "Anviwònman",
      "logOut": "Dekonekte",
      "privacyPolicy": "Règleman sou vi prive",
      "deleteAccount": "Efase kont",
      "termsOfServices": "Tèm sèvis yo",
      "noInternetConnection": "Pa gen koneksyon Entènèt",
      "badResponseRequest": "Repons demann lan pa bon",
      "requestTimeOut": "Demann lan ekspire",
      "skip": "Sote",
      "next": "Pwochen",
      "getStarted": "Kòmanse",
      "welcomeToTheRideShare": "Byenveni nan RideShare",
      "safeAndSecureJourneys": "Vwayaj san danje ak sekirize.",
      "easyAndConvenientBooking": "Rezèvasyon fasil ak pratik.",
      "seamlessAffordableAndReliableRideSharing": "Sèvis pataje woulib ki fasil, abòdab, e serye nan men ou.",
      "yourSafetyIsOurTopPriorityEveryRideIsMonitored": "Sekirite ou se pi gwo priyorite nou. Chak woulib ap siveye pou lapè lespri ou.",
      "bookYourRideInJustAFewTaps": "Rezève woulib ou a nan kèk klik. Fasil, rapid, san pwoblèm.",
      "orContinueWith": "oswa kontinye ak",
      "enterYourEmailToReset": "Antre imel ou pou reinitialiser modpas ou.",
      "investSmarterWithHAVN": "Envesti pi entelijan ak HAVN",
      "accessDetailedPropertyAnalytics": "Aksè analiz byen imobilye detaye",
      "getMarketInsightsInstantly": "Resevwa analiz sou mache a touswit",
      "personalizedFinancialProjections": "Projèksyon finansye pèsonalize",
      "tryForFree": "Eseye gratis (3 rechèch byen imobilye)",
      "noPaymentNow": "Pa gen peman kounye a",
      "discoverYourNextInvestment": "Dekouvri pwochen envestisman ou",
      "searchAddressCityLocation": "Chèche adrès, vil, kote",
      "recentlyViewed": "Dènye konsiltasyon yo",
      "upgradePlan": "Mizajou plan an",
      "helpCenter": "Sant èd",
      "feedBack": "Fè kòmantè",
      "requestFeature": "Mande yon fonksyon",
      "termsOfService": "Tèm sèvis yo",
      "update": "Mizajou",
      "motoBike": "Moto",
      "car": "Machin",
      "schedule": "Orè",
      "rentCar": "Lwe machin",
      "takeRide": "Pran yon woulib pou ale nan",
      "searchDestination": "Chèche destinasyon",
      "home": "Kay",
      "setAddress": "Mete adrès",
      "work": "Travay",
      "multiplePromos": "Ou gen plizyè promos.",
      "termsApply": "Tèm aplike",
      "moreWayScope": "Plizyè fason pou itilize Scoop",
      "passengerSafety": "Sekirite pasaje",
      "firstClassRide": "Woulib premye klas",
      "onTripIssues": "Èd pandan woulib pou pwoblèm sekirite",
      "topRated": "Chofè ki gen bon nòt, machin nouvo",
      "yourLocation": "Kote ou ye",
      "orderTracking": "Siveyans kòmand",
      "requestHistory": "Istwa demann",
      "safety": "Sekirite",
      "faq": "KPS",
      "setLocation": "Mete kote",
      "confirmHomeAddress": "Konfime adrès lakay ou",
      "confirmOfficeAddress": "Konfime adrès travay",
      "choseBike": "Chwazi yon moto",
      "findingRide": "Nou ap chèche woulib ki toupre...",
      "nearbyRides": "Nou voye demann ou a bay chofè ki toupre yo.",
      "yourTrip": "Woulib ou",
      "cancelRide": "Anile woulib sa a?",
      "cardHolderName": "Antre non sou kat la",
      "cardHolderNumber": "Antre nimewo kat la",
      "cvc": "CVV/CVC",
      "date": "Dat",
      "bookNow": "Rezève kounye a",
      "applySaved": "Nou ap otomatikman aplike sa ki deja sove.",
      "scheduleRide": "Pwograme woulib ou",
      "scheduleRideNext": "Pwograme pwochen vwayaj ou jiska 60 jou annaryè.",
      "name": "Non",
      "male": "Gason",
      "female": "Fi",
      "others": "Lòt",
      "address": "Adrès",
      "doYouWantToLogoutProfile": "Ou vle dekonekte pwofil ou?",
      "history": "Istwa",
      "tripDetails": "Detay vwayaj",
      "tripId": "ID vwayaj",
      "tripInfo": "Enfòmasyon sou vwayaj",
      "copy": "KOPIYE",
      "receipt": "Resi",
      "baseFare": "Pri debaz",
      "distance": "Distans",
      "time": "Tan",
      "safetyFee": "Frè sekirite",
      "subtotal": "Sou total",
      "discount": "Rabè",
      "netFare": "Pri net",
      "viewDetails": "Gade detay",
      "sendMessage": "Voye yon mesaj gratis",
      "cancelNow": "Anile kounye a",
      "pending": "Anreta",
      "complete": "Fini",
      "offers": "Of",
      "language": "Lang",
      "changePasswords": "Chanje modpas",
      "deleteAccounts": "Efase kont"
    },
  };
}
