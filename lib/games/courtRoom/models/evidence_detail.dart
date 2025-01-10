class EvidenceDetail {
  final String title;
  final String description;
  final String type; // document, image, testimony, etc.
  final String source;
  final DateTime dateSubmitted;
  final List<String> relatedArticles;
  final Map<String, String> additionalInfo;

  EvidenceDetail({
    required this.title,
    required this.description,
    required this.type,
    required this.source,
    required this.dateSubmitted,
    required this.relatedArticles,
    required this.additionalInfo,
  });
}