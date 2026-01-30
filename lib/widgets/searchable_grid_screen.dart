import 'package:bloc_practice/res/theme/theme.dart';
import 'package:bloc_practice/utils/responsiveSize.dart';
import 'package:bloc_practice/widgets/custom_appbar.dart';
import 'package:bloc_practice/widgets/custom_text_form_field.dart';
import 'package:bloc_practice/widgets/empty_state_widget.dart';
import 'package:bloc_practice/widgets/error_state_widget.dart';
import 'package:flutter/material.dart';


/// Generic searchable grid screen that can be used for brands, categories, or any browseable items
class SearchableGridScreen<T> extends StatefulWidget {
  final String title;
  final String searchHint;
  final String noItemsMessage;
  final String noResultsMessage;

  // Data access functions
  final List<T> items;
  final bool isLoading;
  final String? error;

  // Item property extractors
  final String Function(T) getTitle;
  final String Function(T) getImage;
  final int Function(T) getId;

  // Navigation
  final String routeName;
  final String argumentKey;

  // Icons for empty/error states
  final IconData emptyStateIcon;
  final VoidCallback? onRetry;

  const SearchableGridScreen({
    super.key,
    required this.title,
    required this.searchHint,
    required this.noItemsMessage,
    this.noResultsMessage = 'No results found',
    required this.items,
    required this.isLoading,
    this.error,
    required this.getTitle,
    required this.getImage,
    required this.getId,
    required this.routeName,
    required this.argumentKey,
    required this.emptyStateIcon,
    this.onRetry,
  });

  @override
  State<SearchableGridScreen<T>> createState() =>
      _SearchableGridScreenState<T>();
}

class _SearchableGridScreenState<T> extends State<SearchableGridScreen<T>> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<T> get _filteredItems {
    if (_searchQuery.isEmpty) {
      return widget.items;
    }
    return widget.items
        .where((item) => widget
            .getTitle(item)
            .toLowerCase()
            .contains(_searchQuery.toLowerCase()))
        .toList();
  }

  void _handleItemTap(T item) {
    Navigator.pushNamed(
      context,
      widget.routeName,
      arguments: {widget.argumentKey: widget.getId(item)},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            CustomColors.homeGradient1,
            CustomColors.homeGradient2,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          showBackButton: true,
          centerTitle: true,
          title: widget.title,
          backgroundColor: Colors.transparent,
          textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20.rf(context),
                color: Colors.black87,
              ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.rw(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.rh(context)),
              _buildSearchField(),
              SizedBox(height: 24.rh(context)),
              Expanded(child: _buildContent()),
              SizedBox(height: 20.rh(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: CustomTextFormField(
        controller: _searchController,
        onChange: (value) {
          setState(() {
            _searchQuery = value.toString();
          });
        },
        hintText: widget.searchHint,
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontSize: 16.rf(context),
        ),
        suffix: IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.grey[400],
          ),
          onPressed: () {
            _searchController.clear();
            setState(() {
              _searchQuery = '';
            });
          },
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.rw(context),
          vertical: 16.rh(context),
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (widget.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (widget.error != null) {
      return ErrorStateWidget(
        errorMessage: widget.error!,
        onRetry: widget.onRetry ??
            () {
              // Default retry behavior - can be overridden
            },
        icon: Icons.error_outline,
        iconColor: Colors.red,
      );
    }

    if (widget.items.isEmpty) {
      return EmptyStateWidget(
        icon: widget.emptyStateIcon,
        title: widget.noItemsMessage,
        titleStyle: TextStyle(
          fontSize: 18.rf(context),
          color: CustomColors.appbarTextColor80,
          fontWeight: FontWeight.w600,
        ),
        iconColor: CustomColors.appbarTextColor80.withOpacity(0.5),
      );
    }

    final filtered = _filteredItems;

    if (filtered.isEmpty) {
      return EmptyStateWidget(
        icon: Icons.search_off,
        title: widget.noResultsMessage,
        titleStyle: TextStyle(
          fontSize: 18.rf(context),
          color: CustomColors.appbarTextColor80,
          fontWeight: FontWeight.w600,
        ),
        iconColor: CustomColors.appbarTextColor80.withOpacity(0.5),
      );
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16.rw(context),
        mainAxisSpacing: 16.rh(context),
        childAspectRatio: 0.60,
      ),
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        final item = filtered[index];
        return SizedBox();
      },
    );
  }
}
