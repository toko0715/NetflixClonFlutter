import 'package:flutter/cupertino.dart';
import '../data/app_data.dart';
import '../theme/app_theme.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 14, left: 4),
            child: Text('Preguntas frecuentes', style: AppTheme.sectionTitle()),
          ),
          // CupertinoListSection — agrupa CupertinoListTiles estilo iOS
          CupertinoListSection(
            backgroundColor: AppTheme.netflixBlack,
            decoration: const BoxDecoration(color: AppTheme.netflixMediumGray),
            dividerMargin: 0,
            hasLeading: false,
            children: AppData.faqItems
                .map((item) => _FaqCupertinoTile(item: item))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _FaqCupertinoTile extends StatefulWidget {
  final Map<String, String> item;
  const _FaqCupertinoTile({required this.item});

  @override
  State<_FaqCupertinoTile> createState() => _FaqCupertinoTileState();
}

class _FaqCupertinoTileState extends State<_FaqCupertinoTile>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 260), vsync: this);
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
      _expanded ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CupertinoListTile — reemplaza ListTile
        CupertinoListTile(
          backgroundColor: AppTheme.netflixMediumGray,
          backgroundColorActivated: const Color(0xFF3D3D3D),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          title: Text(widget.item['question']!,
              style: AppTheme.bodyText(fontSize: 16)),
          // CupertinoIcons.add / xmark en vez de Icons.add / close
          trailing: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Icon(
              _expanded ? CupertinoIcons.xmark : CupertinoIcons.add,
              key: ValueKey(_expanded),
              color: CupertinoColors.white,
              size: 22,
            ),
          ),
          onTap: _toggle,
        ),
        SizeTransition(
          sizeFactor: _animation,
          child: Container(
            color: const Color(0xFF242424),
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 14, 20, 18),
            child: Text(widget.item['answer']!,
                style: AppTheme.bodyText(fontSize: 15, color: const Color(0xE6FFFFFF))),
          ),
        ),
      ],
    );
  }
}
