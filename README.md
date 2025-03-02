# Nube de palabras de "Micromachismos: capacidad de detección según la edad"
En la asignatura "Psicología de los Problemas Sociales" de mi grado de Psicología, se requirió la realización de un trabajo sobre un problema social de nuestra elección.
En mi caso, mi grupo y yo elegimos hacer un estudio sobre la capacidad de detección de micromachismos de las personas según la edad.
Para ello, se recogió una muestra de 95 sujetos con edades comprendidas entre los 18 y los 69 años usando la estrategia "bola de nieve".

En el estudio se administró a los participantes un cuestionario anónimo en el que se recogieron sus datos sociodemográficos y se les presentaron seis viñetas de elaboración propia,
mediante las cuales se midió la capacidad de detección de situaciones machistas.

Dado que se requirió de un análisis tanto estadístico como descriptivo, se me ocurrió realizar nubes de palabras para apoyar el análisis descriptivo que realizamos.
Para ello, apliqué mis conocimientos de R que aprendí en mis prácticas con la supervisión de profesionales.

# Proceso
Primero se crearon los grupos y subgrupos necesarios:
1. Según la edad:
* Primer grupo: edad entre 18 y 30 años
* Segundo grupo: edad mayores de 50 años

2. Según la respuesta a la pregunta "¿Detectas algún problema en la forma de relacionarse?"
* Primer grupo: Sí
* Segundo grupo: No

Posteriormente se limpió el texto (convertir texti a minúsculas, eliminar puntuación, eliminar números y eliminar palabras vacías), se creó una matriz de palabras y se eliminaron 
palabras no relevantes. Por último, se crea la nube de palabra:

Ejemplo:

**Figura 1.**

Personas entre 18-30 años que hayan dicho "Sí".
![image](https://github.com/user-attachments/assets/f2aa95aa-deab-4548-940d-6c244c119d0b)
