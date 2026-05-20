-- ============================================================
-- Alerta Violeta Colima — Datos de prueba con fechas históricas
-- Período: 15 marzo 2026 – 18 mayo 2026
--
-- Uso (en la consola PSQL de Render):
--   Copia y pega este bloque completo y presiona Enter.
-- ============================================================

INSERT INTO incidentes (titulo, descripcion, categoria, latitud, longitud, estado, created_at) VALUES

-- ── MARZO ─────────────────────────────────────────────────────────

('Acoso', 'Hombre me siguió por varias cuadras cerca del mercado Juárez gritando comentarios obscenos.', 'Acoso', 19.2415, -103.7268, 'Atendido', '2026-03-15 08:42:00'),
('Seguimiento', 'Pasajero me tocó la pierna inapropiadamente en el camión ruta 4 dirección norte.', 'Seguimiento', 19.2433, -103.7250, 'Atendido', '2026-03-16 17:30:00'),
('Violencia Física', 'Hombre me jaló el cabello y se dio a la fuga al salir de la tienda en la calle Guerrero.', 'Violencia Física', 19.2437, -103.7252, 'Atendido', '2026-03-17 21:15:00'),
('Acoso', 'Hombre me bloqueó el paso en la esquina de Reforma y Madero exigiéndome mi número de teléfono.', 'Acoso', 19.2448, -103.7240, 'Atendido', '2026-03-18 14:05:00'),
('Acoso', 'Grupo de hombres me bloquearon el paso frente al Jardín de San José.', 'Acoso', 19.2445, -103.7225, 'Atendido', '2026-03-19 12:20:00'),
('Acoso', 'Individuo tomó fotos sin mi consentimiento mientras esperaba el camión en Av. Tecnológico.', 'Acoso', 19.2380, -103.7190, 'Pendiente', '2026-03-20 09:55:00'),
('Seguimiento', 'Chofer de la ruta Colima-Coquimatlán hizo comentarios sobre mi cuerpo durante el recorrido.', 'Seguimiento', 19.2290, -103.7340, 'Atendido', '2026-03-21 16:40:00'),
('Acoso', 'Dos hombres me rodearon en el mercado Juárez y me tocaron los brazos sin mi consentimiento.', 'Acoso', 19.2418, -103.7265, 'Atendido', '2026-03-22 11:30:00'),
('Acoso', 'Me acosaron verbalmente al salir del OXXO en la calle Madero.', 'Acoso', 19.2460, -103.7255, 'Pendiente', '2026-03-24 20:10:00'),
('Violencia Física', 'Individuo intentó arrebatarme el bolso y me empujó fuerte en la banqueta frente al mercado.', 'Violencia Física', 19.2420, -103.7270, 'Atendido', '2026-03-25 18:55:00'),
('Seguimiento', 'Hombre se pegó a mi cuerpo innecesariamente en camión lleno ruta 2. Me cambié de lugar y me siguió.', 'Seguimiento', 19.2480, -103.7220, 'Pendiente', '2026-03-26 07:45:00'),
('Acoso', 'Silbidos y comentarios sexuales frente al COBAC mientras caminaba con uniforme escolar.', 'Acoso', 19.2510, -103.7210, 'Atendido', '2026-03-27 13:20:00'),
('Violencia Física', 'Hombre me amenazó en la colonia Las Víboras y me empujó cuando intenté gritar pidiendo ayuda.', 'Violencia Física', 19.2280, -103.7190, 'Atendido', '2026-03-28 22:30:00'),
('Acoso', 'Señor en bicicleta me siguió desde la plaza hasta el parque La Alborada haciendo gestos obscenos.', 'Acoso', 19.2390, -103.7310, 'Pendiente', '2026-03-30 15:15:00'),
('Seguimiento', 'Me siguieron desde la bajada del camión hasta tres cuadras adelante.', 'Seguimiento', 19.2400, -103.7280, 'Atendido', '2026-03-31 19:00:00'),

-- ── ABRIL ─────────────────────────────────────────────────────────

('Violencia Física', 'Agresión física por parte de pareja en la vía pública frente al Palacio de Gobierno.', 'Violencia Física', 19.2440, -103.7248, 'Atendido', '2026-04-01 23:00:00'),
('Acoso', 'Hombre adulto intentó tomarme del brazo en el tianguis del centro.', 'Acoso', 19.2425, -103.7245, 'Pendiente', '2026-04-02 10:30:00'),
('Seguimiento', 'Exhibicionismo dentro del camión en ruta al centro. El individuo estaba en el asiento trasero.', 'Seguimiento', 19.2358, -103.7200, 'Atendido', '2026-04-03 08:10:00'),
('Seguimiento', 'Hombre dentro del camión metió la mano en mi mochila. Al reclamarlo comenzó a intimidarme.', 'Seguimiento', 19.2490, -103.7255, 'Atendido', '2026-04-04 17:25:00'),
('Acoso', 'Exhibicionismo en plena calle Constitución a las 9 pm frente a una papelería.', 'Acoso', 19.2440, -103.7238, 'Pendiente', '2026-04-05 21:05:00'),
('Seguimiento', 'Pasajero me tomó foto con el celular dentro del camión sin mi permiso.', 'Seguimiento', 19.2530, -103.7265, 'Pendiente', '2026-04-07 08:50:00'),
('Violencia Física', 'Me empujaron contra la pared en callejón oscuro cerca de la terminal de camiones.', 'Violencia Física', 19.2398, -103.7282, 'Atendido', '2026-04-08 21:40:00'),
('Acoso', 'Me gritaron desde un carro mientras caminaba por el bulevar Camino Real.', 'Acoso', 19.2350, -103.7180, 'Pendiente', '2026-04-09 14:15:00'),
('Violencia Física', 'Hombre en bicicleta me jaló violentamente el cabello al pasar y salió huyendo hacia el bulevar.', 'Violencia Física', 19.2362, -103.7185, 'Atendido', '2026-04-10 16:00:00'),
('Acoso', 'Motociclista se acercó repetidamente mientras caminaba sola cerca de la Universidad de Colima.', 'Acoso', 19.2548, -103.7282, 'Pendiente', '2026-04-11 11:40:00'),
('Seguimiento', 'Hombre mayor me rozó la mano repetidamente en el camión lleno. Fue claramente intencional.', 'Seguimiento', 19.2410, -103.7290, 'Atendido', '2026-04-12 18:20:00'),
('Violencia Física', 'Hombre en moto intentó arrebatarme el teléfono. Me lastimó la muñeca al jalar.', 'Violencia Física', 19.2370, -103.7215, 'Atendido', '2026-04-14 20:30:00'),
('Acoso', 'Trabajador de construcción me lanzó piropos obscenos y siguió mis movimientos visualmente.', 'Acoso', 19.2470, -103.7300, 'Pendiente', '2026-04-15 09:00:00'),
('Acoso', 'Grupo de hombres me rodeó a la salida del cajero en la calle 5 de Mayo haciéndome sentir en peligro.', 'Acoso', 19.2432, -103.7256, 'Atendido', '2026-04-16 20:55:00'),
('Acoso', 'Hombre en estado de ebriedad me bloqueó el paso en el callejón Rayón y me tocó el cabello.', 'Acoso', 19.2433, -103.7262, 'Atendido', '2026-04-17 22:10:00'),
('Seguimiento', 'Me bajé del camión antes de mi destino porque un pasajero me intimidaba.', 'Seguimiento', 19.2340, -103.7170, 'Pendiente', '2026-04-19 08:00:00'),
('Violencia Física', 'Me golpearon en el brazo para quitarme la mochila cuando salía de la secundaria Técnica.', 'Violencia Física', 19.2520, -103.7230, 'Atendido', '2026-04-20 14:45:00'),
('Acoso', 'Me tomaron video sin consentimiento con el celular afuera del cine Cinépolis.', 'Acoso', 19.2318, -103.7155, 'Pendiente', '2026-04-22 19:30:00'),
('Seguimiento', 'Ayudante del camión me cerró el paso y me pidió mi número de teléfono insistentemente.', 'Seguimiento', 19.2455, -103.7235, 'Atendido', '2026-04-23 17:10:00'),
('Acoso', 'Hombre se sentó junto a mí en el parque Regional y comenzó a tocarme el hombro sin permiso.', 'Acoso', 19.2555, -103.7300, 'Atendido', '2026-04-24 11:00:00'),
('Acoso', 'En el parque Núñez un señor se sentó junto a mí y comenzó a decir cosas inapropiadas.', 'Acoso', 19.2450, -103.7242, 'Pendiente', '2026-04-26 16:50:00'),
('Violencia Física', 'Agresión en el transporte público. El agresor me pellizó fuerte en el brazo.', 'Violencia Física', 19.2415, -103.7260, 'Atendido', '2026-04-28 07:30:00'),
('Seguimiento', 'Grupo de hombres en el camión universitario hicieron comentarios sobre mi apariencia.', 'Seguimiento', 19.2560, -103.7290, 'Pendiente', '2026-04-29 13:15:00'),
('Acoso', 'Fui seguida desde el mercado hasta dos cuadras antes de mi casa por un desconocido.', 'Acoso', 19.2502, -103.7195, 'Atendido', '2026-04-30 20:00:00'),

-- ── MAYO ──────────────────────────────────────────────────────────

('Acoso', 'Hombre me gritó comentarios obscenos en el camellón de la Av. Rey Colimán.', 'Acoso', 19.2335, -103.7168, 'Pendiente', '2026-05-02 09:20:00'),
('Seguimiento', 'Me siguieron a pie desde la parada del camión hasta la entrada de mi colonia.', 'Seguimiento', 19.2388, -103.7305, 'Atendido', '2026-05-04 18:45:00'),
('Violencia Física', 'Me tiraron al piso al salir del gimnasio en la colonia Jardines. Me lastimé la rodilla.', 'Violencia Física', 19.2310, -103.7145, 'Atendido', '2026-05-06 21:55:00'),
('Acoso', 'Desconocido se paró frente a mi auto en el semáforo de Tecnológico y golpeó el vidrio.', 'Acoso', 19.2375, -103.7192, 'Pendiente', '2026-05-08 08:05:00'),
('Violencia Física', 'Me jalaron violentamente el cabello afuera de la Preparatoria Regional. El agresor huyó corriendo.', 'Violencia Física', 19.2498, -103.7238, 'Pendiente', '2026-05-10 14:30:00'),
('Seguimiento', 'Hombre me grabó con el celular en el camión. Lo confronté y se bajó en la siguiente parada.', 'Seguimiento', 19.2420, -103.7275, 'Pendiente', '2026-05-12 07:55:00'),
('Acoso', 'Me acosaron verbalmente en el tianguis de la colonia Reserva Territorial.', 'Acoso', 19.2265, -103.7210, 'Pendiente', '2026-05-13 11:10:00'),
('Violencia Física', 'Agresión con empujones cerca de la terminal central de autobuses.', 'Violencia Física', 19.2395, -103.7285, 'Pendiente', '2026-05-15 22:00:00'),
('Acoso', 'Grupo de adolescentes me siguió en moto haciendo comentarios y bloqueando la banqueta.', 'Acoso', 19.2462, -103.7248, 'Pendiente', '2026-05-16 20:40:00'),
('Seguimiento', 'El chofer del camión nocturno no me permitió bajar en mi parada y siguió manejando.', 'Seguimiento', 19.2302, -103.7330, 'Pendiente', '2026-05-17 23:15:00'),
('Acoso', 'Motociclista me siguió por calle Zaragoza gritando comentarios y acercándose de manera amenazante.', 'Acoso', 19.2443, -103.7253, 'Pendiente', '2026-05-18 19:30:00');
