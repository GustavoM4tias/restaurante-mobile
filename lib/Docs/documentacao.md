### Documentação dos Endpoints

A seguir, cada endpoint disponível na API, com o método HTTP, rota, descrição, parâmetros de entrada e estrutura de resposta.

| Método | Rota                 | Descrição                            | Request Body (JSON)                           | Response Body (JSON)                                                            |
|--------|----------------------|--------------------------------------|-----------------------------------------------|----------------------------------------------------------------------------------|
| GET    | `/usuarios`          | Lista todos os usuários              | —                                             | `[ { id_usuario, nome, email, senha }, ... ]`                                    |
| GET    | `/usuarios/{id}`     | Retorna um usuário por ID            | —                                             | `{ id_usuario, nome, email, senha }`                                             |
| POST   | `/usuarios`          | Cria um novo usuário                 | `{ nome, email, senha }`                      | `{ id_usuario, nome, email, senha }`                                             |
| GET    | `/restaurantes`      | Lista todos os restaurantes          | —                                             | `[ { id_restaurante, nome, latitude, longitude, faixa_preco, horario_funcionamento }, ... ]` |
| GET    | `/restaurantes/{id}` | Retorna um restaurante por ID        | —                                             | `{ id_restaurante, nome, latitude, longitude, faixa_preco, horario_funcionamento }` |
| POST   | `/restaurantes`      | Cria um novo restaurante             | `{ nome, latitude, longitude, faixa_preco, horario_funcionamento }` | `{ id_restaurante, nome, latitude, longitude, faixa_preco, horario_funcionamento }` |
| GET    | `/avaliacoes`        | Lista todas as avaliações            | —                                             | `[ { id_avaliacao, id_usuario, id_restaurante, nota, comentario, data }, ... ]`   |
| POST   | `/avaliacoes`        | Cria uma nova avaliação              | `{ id_usuario, id_restaurante, nota, comentario, data }` | `{ id_avaliacao, id_usuario, id_restaurante, nota, comentario, data }`           |
| GET    | `/culinarias`        | Lista todos os tipos de culinária    | —                                             | `[ { id_culinaria, tipo }, ... ]`                                                |