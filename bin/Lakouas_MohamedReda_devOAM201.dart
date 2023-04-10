import 'dart:io';




void main() {

  while (true) {
    print("1. Créer un compte");
    print("2. Se connecter");
    print("3. Afficher la liste des utilisateurs");
    print("4. Modifier le mot de passe");
    print("5. Supprimer un compte");
    print("6. Quitter");
    stdout.write("Veuillez choisir une option : ");
    String choice = stdin.readLineSync()!;
    switch (choice) {
      case "1":
        {
          stdout.write("Entrez votre email : ");
          String email = stdin.readLineSync()!;
          stdout.write("Entrez votre mot de passe : ");
          String password = stdin.readLineSync()!;
          if (checkPassword(password)) {
            users.add(email);
            users.add(password);
            print("Compte créé avec succès !");
          } else {
            print("Le mot de passe ne satisfait pas les exigences.");
          }
        }
        break;
      case "2":
        {
          stdout.write("Entrez votre email : ");
          String email = stdin.readLineSync()!;
          stdout.write("Entrez votre mot de passe : ");
          String password = stdin.readLineSync()!;
          int userIndex = rechercheUtilisateur(email);
          if (userIndex != -1 && users[userIndex] == password) {
            print("Authentification réussie !");
          } else {
            print("Email ou mot de passe incorrect.");
          }
        }
        break;
      case "3":
        {
          listeUtilisateur();
        }
        break;
      case "4":
        {
          stdout.write("Entrez votre email : ");
          String email = stdin.readLineSync()!;
          stdout.write("Entrez votre nouveau mot de passe : ");
          String newPassword = stdin.readLineSync()!;
          if (checkPassword(newPassword)) {
            modifierModpass(email, newPassword);
          } else {
            print("Le nouveau mot de passe est un valid.");
          }
        }
        break;
      case "5":
        {
          stdout.write("Entrez votre email : ");
          String email = stdin.readLineSync()!;
          suprimerUtilisateur(email);
        }
        break;
      case "6":
        {
          print("Merci d'avoir utilisé notre système d'authentification !");
          return;
        }

      default:
        {
          print("EROR.");
        }
        break;
    }
  }
}

List<String> users = [];

// Fonction pour vérifier si un mot de passe satisfait les exigences
bool checkPassword(String password) {
  return password.length >= 6 &&
      password.contains(RegExp(r'[A-Z]')) &&
      password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
}

// Fonction pour afficher la liste des utilisateurs
void listeUtilisateur() {
  print("Liste des utilisateurs : ");
  for (var user in users) {
    print("\t $user");
  }
}

// Fonction pour chercher l'indice d'un utilisateur dans la liste par email
int rechercheUtilisateur(String email) {
  for (var i = 0; i < users.length; i++) {
    if (users[i] == email) {
      return i;
    }
  }
  return -1;
}

// Fonction pour modifier le mot de passe d'un utilisateur
void modifierModpass(String email, String newPassword) {
  int userIndex = rechercheUtilisateur(email);
  if (userIndex != -1) {
    users[userIndex]= newPassword;
    print("Le mot de passe pour l'utilisateur avec l'email '$email' a été modifié avec succès !");
  } else {
    print("Aucun utilisateur avec l'email '$email' trouvé.");
  }
}

// Fonction pour supprimer un compte utilisateur
void suprimerUtilisateur(String email) {
  int userIndex = rechercheUtilisateur(email);
  if (userIndex != -1) {
    users.removeAt(userIndex);
    print("Le compte de l'utilisateur avec l'email '$email' a été supprimé avec succès !");
  } else {
    print("Aucun utilisateur avec l'email '$email' trouvé.");}
}
