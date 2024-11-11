import Foundation
class RecycleViewModel: ObservableObject {
    @Published var categories: [RecycleCategory] = []

    init() {
        loadCategories()
    }

    private func loadCategories() {
        categories = [
            RecycleCategory(
                title: "Clasificación de Residuos",
                items: [
                    RecycleItem(
                        title: "Orgánicos",
                        icon: "leaf.fill",
                        description: """
Materiales biodegradables, como restos de comida, cáscaras de frutas y verduras, hojas secas, ramas pequeñas, y otros desechos naturales, son sustancias que provienen de organismos vivos y que pueden descomponerse de manera natural por acción de microorganismos, como bacterias, hongos y lombrices. Estos materiales, al descomponerse, se transforman en compost o abono orgánico, que es un recurso valioso para enriquecer el suelo.

Algunos ejemplos de materiales biodegradables incluyen:

- Restos de comida: Como cáscaras de frutas, verduras, huesos pequeños, restos de pan, y granos de café.
- Desechos de jardín: Hojas secas, césped cortado, ramas pequeñas, flores marchitas y otros restos de plantas.
- Papel y cartón: Siempre que no estén recubiertos con tintas o plásticos, el papel es biodegradable y puede ser compostado.
- La compostaje de estos residuos no solo reduce la cantidad de desechos que generamos, sino que también crea un ciclo natural en el que los restos orgánicos se devuelven a la tierra, ayudando a regenerar el medio ambiente y promoviendo la sostenibilidad. De hecho, compostar es una de las prácticas más ecológicas que podemos adoptar en nuestros hogares, comunidades y empresas.
                        
""",
                        youtubeLink: nil,
                        image: "organico"
                    ),
                    RecycleItem(
                        title: "Inorgánicos",
                        icon: "cube.box.fill",
                        description: "Materiales no biodegradables como plásticos, metales, vidrio y textiles. Deben reciclarse adecuadamente para reducir la contaminación.",
                        youtubeLink: nil,
                        image: "inorganico"
                    ),
                    RecycleItem(
                        title: "Papel y Cartón",
                        icon: "doc.fill",
                        description: "Residuos de papel y cartón como cajas, hojas, y periódicos. Estos materiales pueden ser reutilizados o reciclados para fabricar nuevos productos.",
                        youtubeLink: nil,
                        image: "papel"
                    ),
                    RecycleItem(
                        title: "Residuos Peligrosos",
                        icon: "exclamationmark.triangle.fill",
                        description: "Incluyen pilas, baterías, medicamentos vencidos y productos químicos. Deben ser gestionados correctamente para evitar daños al medio ambiente.",
                        youtubeLink: nil,
                        image: "peligroso"
                    ),
                    RecycleItem(
                        title: "Residuos Electrónicos",
                        icon: "desktopcomputer",
                        description: "Aparatos electrónicos como celulares, computadoras y electrodomésticos que ya no funcionan. Pueden ser reciclados para recuperar metales preciosos.",
                        youtubeLink: nil,
                        image: "electronico"
                    ),
                    RecycleItem(
                        title: "Vidrio",
                        icon: "wineglass",
                        description: "Botellas y frascos de vidrio que pueden ser reciclados infinitamente sin perder calidad. Asegúrate de separarlos para su correcto manejo.",
                        youtubeLink: nil,
                        image: "vidrio"
                    )
                ],
                imageName: "Clasificación de Residuos"
            ),
            RecycleCategory(
                title: "Consejos para Reducir, Reutilizar y Reciclar",
                items: [
                    RecycleItem(
                        title: "Reducir el Uso de Plásticos",
                        icon: "drop.triangle",
                        description: """
Usa Envases Reutilizables en Lugar de Bolsas y Botellas Plásticas

Una de las formas más fáciles y efectivas de reducir el consumo de plásticos es optar por envases reutilizables. Cambiar las bolsas plásticas y botellas de agua de un solo uso por alternativas más sostenibles no solo reduce el desperdicio, sino que también contribuye a una economía más circular, en la que los recursos se reutilizan en lugar de desecharse.

¿Por qué elegir envases reutilizables?

- Bolsas reutilizables: Las bolsas de plástico son uno de los contaminantes más comunes en las calles, océanos y vertederos. Cambiar a bolsas de tela, yute o materiales reciclados no solo reduce el consumo de plásticos, sino que también permite transportar más productos sin comprometer la resistencia o el tamaño. Las bolsas de tela, por ejemplo, pueden usarse una y otra vez durante años, lo que reduce significativamente la necesidad de bolsas plásticas.
- Botellas reutilizables: Las botellas plásticas de un solo uso son responsables de una gran parte de los desechos plásticos. Usar botellas reutilizables de acero inoxidable, vidrio o plástico libre de BPA es una opción excelente para mantener el agua potable a la mano, sin recurrir a botellas de plástico desechables. Además, muchas de estas botellas están diseñadas para ser más duraderas y aislantes, manteniendo las bebidas frías o calientes durante horas.
- Envases de comida reutilizables: Otra alternativa efectiva es usar contenedores de vidrio, acero inoxidable o bambú para llevar alimentos. Estos envases son más duraderos y no contienen productos químicos nocivos que pueden liberarse en los alimentos, como en algunos plásticos de baja calidad.
""",
                        youtubeLink: "https://www.youtube.com/watch?v=7NDtVsWv928",
                        image: "reducir_plastico"
                    ),
                    RecycleItem(
                        title: "Reutilizar Contenedores",
                        icon: "cube.fill",
                        description: "Los contenedores de vidrio y plástico pueden ser reutilizados para almacenar alimentos, agua y semillas.",
                        youtubeLink: nil,
                        image: nil
                    ),
                    RecycleItem(
                        title: "Compostaje Casero",
                        icon: "leaf.fill",
                        description: "Convierte restos de comida y material orgánico en compost para enriquecer el suelo de tus cultivos.",
                        youtubeLink: "https://www.youtube.com/watch?v=9Y9aLPgDtDQ",
                        image: nil
                    ),
                    RecycleItem(
                        title: "Ahorro de Agua",
                        icon: "drop.fill",
                        description: "Implementa sistemas de riego por goteo y reutiliza aguas grises para reducir el consumo de agua en la agricultura.",
                        youtubeLink: nil,
                        image: nil
                    ),
                    RecycleItem(
                        title: "Construcción con Materiales Reciclados",
                        icon: "house.fill",
                        description: "Usa materiales reciclados como llantas, botellas y madera para construir estructuras sencillas y resistentes.",
                        youtubeLink: nil,
                        image: nil
                    )
                ],
                imageName: "Consejos para Reducir"
            ),
            RecycleCategory(
                title: "Símbolos del Reciclaje",
                items: [
                    RecycleItem(
                        title: "Papel Reciclable",
                        icon: "doc.fill",
                        description: "Identifica productos de papel que pueden reciclarse, como hojas impresas, cajas de cartón y periódicos.",
                        youtubeLink: nil,
                        image: "papel_reciclable"
                    ),
                    RecycleItem(
                        title: "Plástico Reciclable",
                        icon: "1.square",
                        description: "El símbolo con un número indica el tipo de plástico. Plásticos con el número 1 (PET) y 2 (HDPE) son más fáciles de reciclar.",
                        youtubeLink: nil,
                        image: "plastico_reciclable"
                    ),
                    RecycleItem(
                        title: "Vidrio Reciclable",
                        icon: "wineglass.fill",
                        description: "Botellas y envases de vidrio que pueden ser reciclados varias veces sin perder calidad.",
                        youtubeLink: nil,
                        image: "vidrio_reciclable"
                    ),
                    RecycleItem(
                        title: "Residuos Electrónicos",
                        icon: "desktopcomputer",
                        description: "Símbolo que indica que los aparatos electrónicos deben ser desechados en puntos de reciclaje especializados.",
                        youtubeLink: nil,
                        image: "electronicos"
                    )                ],
                imageName: "Simbolos del Reciclaje"
            ),
            RecycleCategory(
                title: "Transforma y Reutiliza",
                items: [
                    RecycleItem(
                        title: "Botellas de Plástico",
                        icon: "waterbottle.fill",
                        description: """
Cómo Convertir una Botella de Plástico en una Maceta
Las botellas de plástico pueden ser fácilmente transformadas en macetas para tus plantas. Este es un proyecto sencillo y accesible que puedes hacer en poco tiempo y con materiales que seguramente ya tienes en casa.

Pasos para hacer una maceta con una botella de plástico:

1. Elige una botella adecuada: Utiliza una botella de plástico grande, como las de agua o refresco (de 1.5 a 2 litros), ya que ofrecen un buen espacio para que las plantas crezcan.
2. Corta la botella: Utiliza unas tijeras o un cuchillo para cortar la botella por la mitad, horizontalmente. La parte superior de la botella puede ser utilizada como una maceta, mientras que la base puede servir para otros proyectos o para contener más tierra.
3. Haz agujeros para drenaje: Los agujeros en la base de la maceta son esenciales para evitar que el agua se acumule y pudra las raíces de las plantas. Usa un clavo, un destornillador o una broca para hacer varios agujeros pequeños en el fondo de la botella.
4. Decoración opcional: Si deseas hacer la maceta más atractiva, puedes decorarla con pintura, cuerda, tela o incluso papel reciclado. Esto no solo le da un toque personal, sino que también ayuda a que la maceta se integre mejor en tu espacio exterior o interior.
5. Coloca tierra y planta: Llena la maceta con tierra para macetas y planta tu planta favorita. Las botellas de plástico, aunque pequeñas, ofrecen suficiente espacio para plantas pequeñas o hierbas.
Beneficios:

Reciclaje y reutilización: Reutilizar botellas de plástico ayuda a reducir la cantidad de desechos que generamos.
Ahorro de dinero: Es una alternativa económica frente a la compra de macetas nuevas.
Práctico y funcional: Las macetas de plástico reciclado son ligeras y fáciles de mover, lo que facilita el cuidado de tus plantas.
""",
                        youtubeLink: "https://www.youtube.com/watch?v=D_u6mNlHprE",
                        image: "botellas_plastico"
                    ),
                    RecycleItem(
                        title: "Llantas Viejas",
                        icon: "car.fill",
                        description: "Usa llantas como jardineras o material de construcción. Píntalas y llénalas de tierra para plantar vegetales.",
                        youtubeLink: nil,
                        image: "llantas"
                    ),
                    RecycleItem(
                        title: "Ropa Antigua",
                        icon: "tshirt.fill",
                        description: "Transforma ropa vieja en trapos de limpieza o utiliza los retazos para coser mantas y almohadas.",
                        youtubeLink: nil,
                        image: "ropa_reciclada"
                    ),
                    RecycleItem(
                        title: "Cajas de Madera",
                        icon: "shippingbox.fill",
                        description: "Usa cajas de madera para construir estanterías, mesas o maceteros. Lija y barniza para mejorar su durabilidad.",
                        youtubeLink: nil,
                        image: "cajas_madera"
                    )
                ],
                imageName: "Transforma"
            )
        ]
    }
}
