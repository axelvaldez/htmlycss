---
layout: page
title: "Contacto"
tldr: "¿Dudas? ¿Comentarios? ¿Sugerencias de contenido? Dale."
---

<div class="form-container fluid">
    <h3>Mándame un email</h3>
    <form action="/thanks/" name="respond" netlify>
    <p>
        <label for="nombre">Nombre</label>
        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" required>
    </p>
    <p>
        <label for="email">Email</label>
        <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
    </p>
    <p>
        <label for="mensaje">Mensaje</label>
        <textarea class="form-control" id="mensaje" name="mensaje" placeholder="" rows="10" required></textarea>
    </p>
    <p>
        <button type="submit" class="button">Enviar</button>
    </p>
    </form>
</div>