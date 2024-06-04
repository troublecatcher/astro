import 'package:astro/app/helpers.dart';
import 'package:astro/app/theme.dart';
import 'package:astro/common/layout/base_screen.dart';
import 'package:astro/features/secondary/feature_selection/feature_selection_card.dart';
import 'package:astro/features/secondary/feature_selection/feature_selection_cubit.dart';
import 'package:astro/features/secondary/profile/shared/controller/current_profile_cubit.dart';
import 'package:astro/features/secondary/profile/shared/controller/profile_list_cubit.dart';
import 'package:astro/features/secondary/profile/shared/model/profile.dart';
import 'package:astro/features/secondary/profile/creation/profile_creation_widget.dart';
import 'package:astro/features/secondary/profile/shared/profile_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

@RoutePage()
class ProfileSelectionScreen extends StatefulWidget {
  const ProfileSelectionScreen({super.key});

  @override
  State<ProfileSelectionScreen> createState() => _ProfileSelectionScreenState();
}

class _ProfileSelectionScreenState extends State<ProfileSelectionScreen> {
  late PageController pageController;
  ValueNotifier<double> currentPageNotifier = ValueNotifier<double>(0);

  @override
  void initState() {
    super.initState();
    final profiles = context.read<ProfileListCubit>().state;
    final index = profiles.indexOf(context.read<CurrentProfileCubit>().state!);
    pageController = PageController(viewportFraction: 0.4, initialPage: index);
    currentPageNotifier = ValueNotifier<double>(index.toDouble());
    pageController.addListener(() {
      currentPageNotifier.value = pageController.page ?? 0;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      background: Background.main,
      child: BlocBuilder<ProfileListCubit, List<Profile>>(
        builder: (context, profiles) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ValueListenableBuilder<double>(
                    valueListenable: currentPageNotifier,
                    builder: (context, currentPage, child) {
                      return PageView.builder(
                        controller: pageController,
                        scrollDirection: Axis.vertical,
                        itemCount: profiles.length,
                        onPageChanged: (value) => changeProfile(value),
                        itemBuilder: (context, index) {
                          final profile = profiles[index];
                          final scale = 1.0 - (currentPage - index).abs() * 0.3;
                          final condition = currentPage.round() == index;
                          return Transform.scale(
                            scale: scale,
                            child: AnimatedContainer(
                              padding: const EdgeInsets.all(20),
                              duration: Durations.medium1,
                              decoration: BoxDecoration(
                                gradient: condition
                                    ? gradient1
                                    : const LinearGradient(
                                        colors: [surfaceColor, surfaceColor],
                                      ),
                                borderRadius: br10,
                              ),
                              child: Stack(
                                children: [
                                  if (profiles.length != 1 && condition)
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: CupertinoButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () async {
                                          if (index == 0) {
                                            await changeProfile(1);
                                          } else {
                                            await changeProfile(index - 1);
                                          }
                                          await context
                                              .read<ProfileListCubit>()
                                              .delete(index);
                                          if (index == 0) {
                                            await changeProfile(0);
                                          }
                                        },
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ProfileWidget(
                                    profile: profile,
                                    name: Builder(
                                      builder: (context) {
                                        if (condition) {
                                          return Text(
                                            profile.name,
                                            style: horoscopeDayTextStyle,
                                          );
                                        } else {
                                          return GradientText(
                                            profile.name,
                                            style: horoscopeDayTextStyle,
                                            colors: const [color3, color1],
                                          );
                                        }
                                      },
                                    ),
                                    info: Builder(
                                      builder: (context) {
                                        if (condition) {
                                          return Text(
                                            profileInfo(profile),
                                            style: horoscopeDayTextStyle,
                                          );
                                        } else {
                                          return GradientText(
                                            profileInfo(profile),
                                            style: horoscopeDayTextStyle,
                                            colors: const [color3, color1],
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: CupertinoButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                        child: Material(
                          color: Colors.transparent,
                          child: ProfileCreationWidget(
                              title: Row(
                                children: [
                                  const Expanded(
                                    flex: 1,
                                    child: SizedBox.shrink(),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Text(
                                      'New profile creation',
                                      textAlign: TextAlign.center,
                                      style: horoscopeTextStyle,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: CupertinoButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: () =>
                                          context.router.popForced(),
                                      child: const Icon(
                                        Icons.cancel,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              onDone: (Profile profile) async {
                                context
                                    .read<ProfileListCubit>()
                                    .create(profile, setCurrent: false);
                                context.router.popForced();
                              }),
                        ),
                      );
                    },
                  ),
                  child: const Icon(
                    Icons.add_circle_outline_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> changeProfile(int index) async {
    context.read<FeatureSelectionCubit>().set(FeatureState.main);
    final profile = context.read<ProfileListCubit>().state[index];
    context.read<CurrentProfileCubit>().set(profile, index);
    await pageController.animateToPage(
      index,
      duration: Durations.medium1,
      curve: Curves.decelerate,
    );
  }
}
