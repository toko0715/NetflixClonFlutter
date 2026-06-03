import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/app_data.dart';
import '../theme/app_theme.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titulo seccion — Fuente 2: Montserrat
          Text(
            'Preguntas frecuentes',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 16),
          // ListView de preguntas con ListTile expandible
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: AppData.faqItems.length,
            separatorBuilder: (context, _) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              return _FaqItem(item: AppData.faqItems[index]);
            },
          ),
        ],
      ),
    );
  }
}

// ListTile con estado de expansion manual (+ / x)
class _FaqItem extends StatefulWidget {
  final Map<String, String> item;
  const _FaqItem({required this.item});

  @override
  State<_FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<_FaqItem>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _expanded = !_expanded;
      if (_expanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ListTile de la pregunta
        Container(
          decoration: BoxDecoration(
            color: AppTheme.netflixMediumGray,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(4),
              topRight: const Radius.circular(4),
              bottomLeft: Radius.circular(_expanded ? 0 : 4),
              bottomRight: Radius.circular(_expanded ? 0 : 4),
            ),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 6,
            ),
            title: Text(
              widget.item['question']!,
              // Fuente 3: Roboto para preguntas
              style: GoogleFonts.roboto(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Icon(
                _expanded ? Icons.close : Icons.add,
                key: ValueKey(_expanded),
                color: Colors.white,
                size: 26,
              ),
            ),
            onTap: _toggle,
          ),
        ),
        // Respuesta animada
        SizeTransition(
          sizeFactor: _animation,
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF242424),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
            ),
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
            child: Text(
              widget.item['answer']!,
              // Fuente 3: Roboto para respuestas
              style: GoogleFonts.roboto(
                fontSize: 16,
                color: Colors.white.withAlpha(230),
                height: 1.6,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
