import 'package:design_system/design_system.dart';
import 'package:flutter_bloc_starter/features/dev_menu/storybook/helpers/widgets/gallery_widgets.dart';
import 'package:widgetbook/widgetbook.dart';

const _navigationIcons = <(String, IconData)>[
  ('chevron_right', AppIcons.chevron_right),
  ('chevron_left', AppIcons.chevron_left),
  ('chevron_up', AppIcons.chevron_up),
  ('chevron_down', AppIcons.chevron_down),
  ('arrow_left', AppIcons.arrow_left),
  ('arrow_right', AppIcons.arrow_right),
  ('home', AppIcons.home),
  ('more', AppIcons.more),
  ('close', AppIcons.close),
  ('sort', AppIcons.sort),
];

const _actionIcons = <(String, IconData)>[
  ('plus', AppIcons.plus),
  ('check', AppIcons.check),
  ('pencil', AppIcons.pencil),
  ('trash', AppIcons.trash),
  ('send', AppIcons.send),
  ('search', AppIcons.search),
  ('link', AppIcons.link),
  ('share', AppIcons.share),
  ('copy', AppIcons.copy),
  ('refresh', AppIcons.refresh),
  ('download', AppIcons.download),
  ('logout', AppIcons.logout),
  ('camera', AppIcons.camera),
  ('image', AppIcons.image),
  ('mic', AppIcons.mic),
  ('play', AppIcons.play),
  ('pause', AppIcons.pause),
  ('settings', AppIcons.settings),
];

const _statusIcons = <(String, IconData)>[
  ('info', AppIcons.info),
  ('help', AppIcons.help),
  ('warning', AppIcons.warning),
  ('lock', AppIcons.lock),
  ('lock_open', AppIcons.lock_open),
  ('shield', AppIcons.shield),
  ('eye', AppIcons.eye),
  ('eye_off', AppIcons.eye_off),
  ('wifi_off', AppIcons.wifi_off),
  ('loader', AppIcons.loader),
  ('bell', AppIcons.bell),
  ('bell_off', AppIcons.bell_off),
];

const _contentIcons = <(String, IconData)>[
  ('mail', AppIcons.mail),
  ('mail_filled', AppIcons.mail_filled),
  ('chat', AppIcons.chat),
  ('smartphone', AppIcons.smartphone),
  ('sparkle', AppIcons.sparkle),
  ('twinkle', AppIcons.twinkle),
  ('book', AppIcons.book),
  ('bookmark', AppIcons.bookmark),
  ('note', AppIcons.note),
  ('rings', AppIcons.rings),
  ('gift', AppIcons.gift),
  ('star', AppIcons.star),
];

const _natureIcons = <(String, IconData)>[
  ('calendar', AppIcons.calendar),
  ('calendar_filled', AppIcons.calendar_filled),
  ('clock', AppIcons.clock),
  ('timer', AppIcons.timer),
  ('map_pin', AppIcons.map_pin),
  ('globe', AppIcons.globe),
  ('sun', AppIcons.sun),
  ('moon', AppIcons.moon),
  ('sunrise', AppIcons.sunrise),
  ('cloud', AppIcons.cloud),
  ('plant', AppIcons.plant),
];

const _peopleIcons = <(String, IconData)>[
  ('heart', AppIcons.heart),
  ('heart_filled', AppIcons.heart_filled),
  ('user', AppIcons.user),
  ('user_filled', AppIcons.user_filled),
  ('users', AppIcons.users),
  ('smile', AppIcons.smile),
  ('lightbulb', AppIcons.lightbulb),
  ('lightbulb_filled', AppIcons.lightbulb_filled),
  ('cart', AppIcons.cart),
];

final WidgetbookNode iconsExample = WidgetbookComponent(
  name: 'Icons',
  useCases: <WidgetbookUseCase>[
    WidgetbookUseCase(
      name: 'All icons',
      builder: (context) {
        return GalleryPage(
          title: 'Icons',
          children: <Widget>[
            _iconSection(title: 'Navigation', icons: _navigationIcons),
            _iconSection(title: 'Actions', icons: _actionIcons),
            _iconSection(title: 'Status and safety', icons: _statusIcons),
            _iconSection(title: 'Content and communication', icons: _contentIcons),
            _iconSection(title: 'Time, place and nature', icons: _natureIcons),
            _iconSection(title: 'People and feeling', icons: _peopleIcons),
          ],
        );
      },
    ),
  ],
);

Widget _iconSection({required String title, required List<(String, IconData)> icons}) {
  return GallerySection(
    title: title,
    children: <Widget>[
      Wrap(
        spacing: AppSpace.s16,
        runSpacing: AppSpace.s16,
        children: <Widget>[
          for (final (name, icon) in icons)
            GalleryItem(
              label: name,
              centered: true,
              child: AppIcon(icon: icon, size: AppIconSize.lg, semanticLabel: name),
            ),
        ],
      ),
    ],
  );
}
