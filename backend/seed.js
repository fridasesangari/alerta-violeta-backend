/**
 * Script para poblar la base de datos con incidentes de prueba.
 * Llama directamente al backend desplegado en Render.
 *
 * Uso:
 *   node seed.js
 *
 * Requiere Node.js 18+ (fetch nativo).
 */

const BASE_URL = 'https://alerta-violeta-backend.onrender.com';

const incidentes = [
  // ── ACOSO CALLEJERO ──────────────────────────────────────────────
  {
    titulo: 'Acoso',
    categoria: 'Acoso',
    descripcion: 'Hombre me siguió por varias cuadras cerca del mercado Juárez gritando comentarios obscenos.',
    latitud: 19.2415, longitud: -103.7268,
  },
  {
    titulo: 'Acoso',
    categoria: 'Acoso',
    descripcion: 'Grupo de hombres me bloquearon el paso frente al Jardín de San José y me hicieron comentarios inapropiados.',
    latitud: 19.2445, longitud: -103.7225,
  },
  {
    titulo: 'Acoso',
    categoria: 'Acoso',
    descripcion: 'Individuo tomó fotos sin mi consentimiento mientras esperaba el camión en Av. Tecnológico.',
    latitud: 19.2380, longitud: -103.7190,
  },
  {
    titulo: 'Acoso',
    categoria: 'Acoso',
    descripcion: 'Me acosaron verbalmente al salir del OXXO en la calle Madero. El individuo me siguió media cuadra.',
    latitud: 19.2460, longitud: -103.7255,
  },
  {
    titulo: 'Acoso',
    categoria: 'Acoso',
    descripcion: 'Silbidos y comentarios sexuales frente al COBAC mientras caminaba con uniforme escolar.',
    latitud: 19.2510, longitud: -103.7210,
  },
  {
    titulo: 'Acoso',
    categoria: 'Acoso',
    descripcion: 'Señor en bicicleta me siguió desde la plaza hasta el parque La Alborada haciendo gestos obscenos.',
    latitud: 19.2390, longitud: -103.7310,
  },
  {
    titulo: 'Acoso',
    categoria: 'Acoso',
    descripcion: 'Hombre adulto intentó tomarme del brazo en el tianguis del centro. Tuve que correr.',
    latitud: 19.2425, longitud: -103.7245,
  },
  {
    titulo: 'Acoso',
    categoria: 'Acoso',
    descripcion: 'Exhibicionismo en plena calle Constitución a las 9 pm. El individuo estaba frente a una papelería.',
    latitud: 19.2440, longitud: -103.7238,
  },
  {
    titulo: 'Acoso',
    categoria: 'Acoso',
    descripcion: 'Me gritaron cosas desde un carro mientras caminaba por el bulevar Camino Real.',
    latitud: 19.2350, longitud: -103.7180,
  },
  {
    titulo: 'Acoso',
    categoria: 'Acoso',
    descripcion: 'Motociclista se acercó repetidamente mientras caminaba sola cerca de la Universidad de Colima.',
    latitud: 19.2548, longitud: -103.7282,
  },
  {
    titulo: 'Acoso',
    categoria: 'Acoso',
    descripcion: 'Trabajador de construcción me lanzó piropos obscenos y siguió mis movimientos visualmente.',
    latitud: 19.2470, longitud: -103.7300,
  },
  {
    titulo: 'Acoso',
    categoria: 'Acoso',
    descripcion: 'Hombre en estado de ebriedad me bloqueó el paso en el callejón Rayón y me tocó el cabello.',
    latitud: 19.2433, longitud: -103.7262,
  },
  {
    titulo: 'Acoso',
    categoria: 'Acoso',
    descripcion: 'Me tomaron video sin consentimiento con el celular afuera del cine Cinépolis.',
    latitud: 19.2318, longitud: -103.7155,
  },
  {
    titulo: 'Acoso',
    categoria: 'Acoso',
    descripcion: 'En el parque Núñez un señor se sentó junto a mí y comenzó a decir cosas inapropiadas.',
    latitud: 19.2450, longitud: -103.7242,
  },
  {
    titulo: 'Acoso',
    categoria: 'Acoso',
    descripcion: 'Fui seguida desde el mercado hasta dos cuadras antes de mi casa por un desconocido.',
    latitud: 19.2502, longitud: -103.7195,
  },

  // ── ACOSO EN TRANSPORTE PÚBLICO ───────────────────────────────────
  {
    titulo: 'Seguimiento',
    categoria: 'Seguimiento',
    descripcion: 'Pasajero me tocó la pierna inapropiadamente en el camión ruta 4 dirección norte. No reaccioné por miedo.',
    latitud: 19.2433, longitud: -103.7250,
  },
  {
    titulo: 'Seguimiento',
    categoria: 'Seguimiento',
    descripcion: 'Chofer de la ruta Colima-Coquimatlán hizo comentarios sobre mi cuerpo durante todo el recorrido.',
    latitud: 19.2290, longitud: -103.7340,
  },
  {
    titulo: 'Seguimiento',
    categoria: 'Seguimiento',
    descripcion: 'Hombre se pegó a mi cuerpo innecesariamente en camión lleno ruta 2. Me cambié de lugar y me siguió.',
    latitud: 19.2480, longitud: -103.7220,
  },
  {
    titulo: 'Seguimiento',
    categoria: 'Seguimiento',
    descripcion: 'Me siguieron desde la bajada del camión urbano en la terminal hasta tres cuadras adelante.',
    latitud: 19.2400, longitud: -103.7280,
  },
  {
    titulo: 'Seguimiento',
    categoria: 'Seguimiento',
    descripcion: 'Exhibicionismo dentro del camión en ruta al centro. El individuo estaba en el asiento trasero.',
    latitud: 19.2358, longitud: -103.7200,
  },
  {
    titulo: 'Seguimiento',
    categoria: 'Seguimiento',
    descripcion: 'Pasajero me tomó foto con el celular dentro del camión sin mi permiso. Se bajó antes de que pudiera hacer algo.',
    latitud: 19.2530, longitud: -103.7265,
  },
  {
    titulo: 'Seguimiento',
    categoria: 'Seguimiento',
    descripcion: 'Hombre mayor me rozó la mano repetidamente en el camión lleno. Fue claramente intencional.',
    latitud: 19.2410, longitud: -103.7290,
  },
  {
    titulo: 'Seguimiento',
    categoria: 'Seguimiento',
    descripcion: 'Me bajé del camión antes de mi destino porque un pasajero me intimidaba con comentarios y miradas.',
    latitud: 19.2340, longitud: -103.7170,
  },
  {
    titulo: 'Seguimiento',
    categoria: 'Seguimiento',
    descripcion: 'Ayudante del camión me cerró el paso cuando iba a bajar y me preguntó mi número de teléfono insistentemente.',
    latitud: 19.2455, longitud: -103.7235,
  },
  {
    titulo: 'Seguimiento',
    categoria: 'Seguimiento',
    descripcion: 'Grupo de hombres dentro del camión universitario hicieron comentarios sobre mi apariencia durante el trayecto.',
    latitud: 19.2560, longitud: -103.7290,
  },

  // ── VIOLENCIA FÍSICA ─────────────────────────────────────────────
  {
    titulo: 'Violencia Física',
    categoria: 'Violencia Física',
    descripcion: 'Hombre me jaló el cabello y se dio a la fuga al salir del bar en la calle Guerrero. Sin testigos.',
    latitud: 19.2437, longitud: -103.7252,
  },
  {
    titulo: 'Violencia Física',
    categoria: 'Violencia Física',
    descripcion: 'Individuo intentó arrebatarme el bolso y me empujó fuerte en la banqueta frente al mercado.',
    latitud: 19.2420, longitud: -103.7270,
  },
  {
    titulo: 'Violencia Física',
    categoria: 'Violencia Física',
    descripcion: 'Agresión física por parte de pareja en la vía pública frente al Palacio de Gobierno. Nadie intervino.',
    latitud: 19.2440, longitud: -103.7248,
  },
  {
    titulo: 'Violencia Física',
    categoria: 'Violencia Física',
    descripcion: 'Me empujaron contra la pared en callejón oscuro cerca de la terminal de camiones.',
    latitud: 19.2398, longitud: -103.7282,
  },
  {
    titulo: 'Violencia Física',
    categoria: 'Violencia Física',
    descripcion: 'Hombre en moto intentó arrebatarme el teléfono. Me lastimó la muñeca al jalar el celular.',
    latitud: 19.2370, longitud: -103.7215,
  },
  {
    titulo: 'Violencia Física',
    categoria: 'Violencia Física',
    descripcion: 'Me golpearon en el brazo para quitarme la mochila cuando salía de la secundaria Técnica.',
    latitud: 19.2520, longitud: -103.7230,
  },
  {
    titulo: 'Violencia Física',
    categoria: 'Violencia Física',
    descripcion: 'Agresión en el transporte público. El agresor me pellizó fuerte en el brazo y bajó en la siguiente parada.',
    latitud: 19.2415, longitud: -103.7260,
  },
  {
    titulo: 'Violencia Física',
    categoria: 'Violencia Física',
    descripcion: 'Me tiraron al piso al salir del gimnasio en la colonia Jardines. Perdí mis cosas y me lastimé la rodilla.',
    latitud: 19.2310, longitud: -103.7145,
  },

  // ── ACOSO Y SEGUIMIENTO ADICIONALES ─────────────────────────────
  {
    titulo: 'Acoso',
    categoria: 'Acoso',
    descripcion: 'Hombre me gritó comentarios obscenos en el camellón de la Av. Rey Colimán mientras trotaba.',
    latitud: 19.2335, longitud: -103.7168,
  },
  {
    titulo: 'Seguimiento',
    categoria: 'Seguimiento',
    descripcion: 'Me siguieron a pie desde la parada del camión hasta la entrada de mi colonia sin dejar de hablarme.',
    latitud: 19.2388, longitud: -103.7305,
  },
  {
    titulo: 'Acoso',
    categoria: 'Acoso',
    descripcion: 'Desconocido se paró frente a mi auto en el semáforo de Tecnológico y golpeó el vidrio para decirme cosas.',
    latitud: 19.2375, longitud: -103.7192,
  },
  {
    titulo: 'Seguimiento',
    categoria: 'Seguimiento',
    descripcion: 'Hombre me grabó con el celular dentro del camión. Lo confronté y se bajó en la siguiente parada.',
    latitud: 19.2420, longitud: -103.7275,
  },
  {
    titulo: 'Acoso',
    categoria: 'Acoso',
    descripcion: 'Me acosaron verbalmente en el tianguis de la colonia Reserva Territorial. Eran dos hombres adultos.',
    latitud: 19.2265, longitud: -103.7210,
  },
  {
    titulo: 'Acoso',
    categoria: 'Acoso',
    descripcion: 'Grupo de adolescentes me siguió en moto haciendo comentarios y bloqueando la banqueta.',
    latitud: 19.2462, longitud: -103.7248,
  },
  {
    titulo: 'Seguimiento',
    categoria: 'Seguimiento',
    descripcion: 'El chofer del camión nocturno no me permitió bajar en mi parada y siguió manejando dos cuadras más.',
    latitud: 19.2302, longitud: -103.7330,
  },
];

async function insertarIncidente(incidente) {
  const res = await fetch(`${BASE_URL}/incidentes`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(incidente),
  });

  if (!res.ok) {
    throw new Error(`HTTP ${res.status}`);
  }

  return res.json();
}

async function main() {
  console.log(`\nAlerta Violeta — Script de datos de prueba`);
  console.log(`Insertando ${incidentes.length} incidentes en ${BASE_URL}\n`);
  console.log('NOTA: El backend en Render tarda ~30 segundos en despertar si estuvo inactivo.\n');

  let exitosos = 0;
  let fallidos = 0;

  for (let i = 0; i < incidentes.length; i++) {
    const inc = incidentes[i];
    try {
      await insertarIncidente(inc);
      exitosos++;
      console.log(`[${i + 1}/${incidentes.length}] ✓ ${inc.categoria} — ${inc.descripcion.substring(0, 50)}...`);
    } catch (e) {
      fallidos++;
      console.log(`[${i + 1}/${incidentes.length}] ✗ Error: ${e.message}`);
    }

    // Pausa breve para no saturar el servidor
    await new Promise((r) => setTimeout(r, 300));
  }

  console.log(`\n Completado: ${exitosos} insertados, ${fallidos} fallidos.`);
  if (exitosos > 0) {
    console.log(' Recarga el panel de administración para ver los datos en el mapa.\n');
  }
}

main();
