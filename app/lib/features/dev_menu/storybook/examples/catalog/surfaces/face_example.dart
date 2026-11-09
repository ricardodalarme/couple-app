import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:ui/ui.dart';
import 'package:widgetbook/widgetbook.dart';

final WidgetbookNode faceExample = WidgetbookComponent(
  name: 'BaseFace',
  useCases: <WidgetbookUseCase>[
    WidgetbookUseCase(
      name: 'All kinds, sizes and selected',
      builder: (context) {
        const faceLabels = <(FaceKind, String)>[
          (FaceKind.good, 'Good'),
          (FaceKind.affectionate, 'Affectionate'),
          (FaceKind.tired, 'Tired'),
          (FaceKind.tense, 'Tense'),
          (FaceKind.sad, 'Sad'),
          (FaceKind.thinking, 'Thinking'),
          (FaceKind.smile, 'Smile'),
        ];

        return GalleryPage(
          title: 'Face',
          children: <Widget>[
            GallerySection(
              title: 'Seven kinds',
              children: <Widget>[
                Wrap(
                  spacing: AppSpace.s16,
                  runSpacing: AppSpace.s16,
                  children: <Widget>[
                    for (final (kind, label) in faceLabels)
                      GalleryItem(
                        label: label,
                        child: BaseFace(kind: kind, semanticLabel: '$label face'),
                      ),
                  ],
                ),
              ],
            ),
            GallerySection(
              title: 'Five sizes',
              children: <Widget>[
                GalleryRow(
                  children: <Widget>[
                    for (final size in FaceSize.values)
                      GalleryItem(
                        label: size.name,
                        child: BaseFace(kind: FaceKind.smile, size: size),
                      ),
                  ],
                ),
              ],
            ),
            GallerySection(
              title: 'Selected',
              children: <Widget>[
                GalleryRow(
                  children: <Widget>[
                    for (final (kind, _) in faceLabels) BaseFace(kind: kind, selected: true),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    ),
  ],
);
