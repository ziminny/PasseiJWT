
# 🔐 PasseiJWT

[![CI Status](https://img.shields.io/travis/95707007/PasseiJWT.svg?style=flat)](https://travis-ci.org/95707007/PasseiJWT)
[![Version](https://img.shields.io/cocoapods/v/PasseiJWT.svg?style=flat)](https://cocoapods.org/pods/PasseiJWT)
[![License](https://img.shields.io/cocoapods/l/PasseiJWT.svg?style=flat)](https://cocoapods.org/pods/PasseiJWT)
[![Platform](https://img.shields.io/cocoapods/p/PasseiJWT.svg?style=flat)](https://cocoapods.org/pods/PasseiJWT)

O **PasseiJWT** é uma biblioteca em Swift para manipulação segura de **JSON Web Tokens (JWT)**, permitindo a criptografia e descriptografia de payloads em aplicações iOS.

---

## **Descrição**

Esta biblioteca fornece uma solução prática para criar, assinar, criptografar e validar JWTs. É ideal para aplicações que precisam de autenticação e autorização seguras usando padrões web.

---

## **Exemplo de Uso**

Para rodar o projeto de exemplo, siga os passos abaixo:

1. Clone o repositório.
2. Navegue até o diretório `Example`.
3. Execute o comando `pod install`.
4. Abra o projeto no Xcode e rode o exemplo.

---

## **Requisitos**

- **Swift**: 5.0 ou superior
- **iOS**: Compatível com iOS 11.0+
- **CocoaPods** instalado

---

## **Instalação**

### **Usando CocoaPods**

PasseiJWT está disponível no [CocoaPods](https://cocoapods.org). Para instalar, adicione a seguinte linha ao seu `Podfile`:

```ruby
pod 'PasseiJWT'
```

Depois, execute o comando:

```bash
pod install
```

### **Manual**

Você também pode importar o projeto diretamente ao clonar o repositório e adicionar os arquivos necessários ao seu projeto.

---

## **Como Usar**

### **Exemplo Básico em Swift:**

```swift
import PasseiJWT

let token = JWTManager.generateToken(payload: ["userId": "123", "role": "admin"])
print("Token JWT gerado:", token)

let isValid = JWTManager.verifyToken(token)
print("Token válido:", isValid)
```

---

## **Contribuição**

Contribuições são bem-vindas! Siga os passos abaixo para colaborar:

1. Faça um fork do projeto.
2. Crie uma branch para suas alterações (`git checkout -b minha-feature`).
3. Faça commit das alterações (`git commit -m 'Minha nova feature'`).
4. Envie as alterações para o seu fork (`git push origin minha-feature`).
5. Abra um Pull Request para revisão.

---

## **Licença**

PasseiJWT está disponível sob a licença **MIT**. Consulte o arquivo `LICENSE` para mais informações.

---

## **Autor**

Desenvolvido por **Vagner Oliveira**  
E-mail: ziminny@gmail.com

---

## **Recursos úteis**

- [Documentação sobre JWT](https://jwt.io/introduction/)
- [Swift.org](https://swift.org)
- [Documentação CocoaPods](https://guides.cocoapods.org/)
