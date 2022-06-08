enum ProjectStatus {
  em_andamento(label: 'Em andamento'),
  finalizado(label: 'Finalizado');

  // 1º para pegar o enum e mostrar na tela preciso ter um label
  final String label;

  const ProjectStatus({required this.label}); 
}
