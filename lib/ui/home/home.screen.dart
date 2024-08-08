import 'package:auto_route/annotations.dart';
import 'package:extensions_pack/extensions_pack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian/config/config.dart';
import 'package:tractian/domain/domain.dart';
import 'package:tractian/ui/home/home.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AppAssets.logo),
      ),
      body: SafeArea(
        child: Padding(
          padding: kSMHorizontal + kSMTop,
          child: BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            child: Builder(
              builder: (context) {
                return BlocSelector<HomeCubit, HomeState, bool>(
                  selector: (state) => state.loading,
                  builder: (context, loading) {
                    if (loading) {
                      return const HomeLoadingContent();
                    } else {
                      return BlocSelector<HomeCubit, HomeState, List<Company>>(
                        selector: (state) => state.companies,
                        builder: (context, companies) {
                          return HomeCompaniesContent(
                            key: ValueKey(companies.length),
                            companies: companies,
                          );
                        },
                      );
                    }
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
