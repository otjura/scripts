#include <iostream>

main() {
  bool exit = false;
  double yuan;
  double eur;
  while (exit == false) {
    std::cout << "元: ";
    std::cin >> yuan;
    if(yuan <= 0) {
      exit = true;
    } else {
      eur = yuan * 0.137;
      std::cout << eur << " €" << std::endl; 
    }
  }
}
