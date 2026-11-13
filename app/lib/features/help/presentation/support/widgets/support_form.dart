import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/help/data/models/support_topic.dart';
import 'package:flutter_bloc_starter/features/help/presentation/support/cubit/support_cubit.dart';
import 'package:flutter_bloc_starter/l10n/l10n_map_extension.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';

class const SupportForm({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n.helpSupport;
    final topic = context.select((SupportCubit cubit) => cubit.state.topic);
    final message = context.select((SupportCubit cubit) => cubit.state.message);
    final replyEmail = context.select((SupportCubit cubit) => cubit.state.replyEmail);
    final isLoading = context.select((SupportCubit cubit) => cubit.state.sendAction.isLoading);
    final cubit = context.read<SupportCubit>();

    return BaseStackedContent(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(
            header: true,
            child: AppHighlightedText(
              text: l10n.supportHeading,
              highlight: l10n.supportHighlight,
              style: context.text.display,
            ),
          ),
          const SizedBox(height: AppSpace.s16),
          Wrap(
            spacing: AppSpace.s8,
            runSpacing: AppSpace.s8,
            children: [
              for (final value in SupportTopic.values)
                BaseChoiceChip(
                  label: l10n.topics.selectOrFallback(value.name),
                  isSelected: topic == value,
                  onTap: () => cubit.onTopicChosen(value),
                ),
            ],
          ),
          const SizedBox(height: AppSpace.s20),
          Text(l10n.messageLabel, style: context.text.label),
          const SizedBox(height: AppSpace.s8),
          BaseTextArea(
            text: message.value,
            hint: l10n.messageHint,
            maxLength: supportMessageMaxLength,
            errorText: l10n.messageErrors.selectOrNull(message.errorName),
            onChanged: cubit.onMessageChanged,
          ),
          const SizedBox(height: AppSpace.s16),
          BaseTextField(
            text: replyEmail.value,
            label: l10n.replyEmailLabel,
            hint: l10n.replyEmailHint,
            type: BaseTextFieldType.email,
            errorText: l10n.replyEmailErrors.selectOrNull(replyEmail.errorName),
            onChanged: cubit.onReplyEmailChanged,
          ),
          const SizedBox(height: AppSpace.s20),
          BaseNote(text: l10n.replyTime, icon: AppIcons.clock),
        ],
      ),
      footer: BaseButton(text: l10n.send, isLoading: isLoading, onPressed: cubit.send),
    );
  }
}
