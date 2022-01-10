package com.IndieAn.GoFundIndie.Resolvers;

import com.IndieAn.GoFundIndie.Resolvers.DTO.Board.CreateBoardCompleteDTO;
import com.IndieAn.GoFundIndie.Resolvers.DTO.Board.PutBoardDTO;
import com.IndieAn.GoFundIndie.Resolvers.DTO.Board.WrappingCreateTempBoardDTO;
import com.IndieAn.GoFundIndie.Resolvers.DTO.BoardGenre.WrappingLinkBoardGenreDTO;
import com.IndieAn.GoFundIndie.Resolvers.DTO.BoardReport.CreateBoardReportDTO;
import com.IndieAn.GoFundIndie.Resolvers.DTO.Casting.CreateCastingCompleteDTO;
import com.IndieAn.GoFundIndie.Resolvers.DTO.Casting.PutCastingDTO;
import com.IndieAn.GoFundIndie.Resolvers.DTO.Casting.WrappingCreateTempCastingDTO;
import com.IndieAn.GoFundIndie.Resolvers.DTO.Genre.GenreGraphQLDTO;
import com.IndieAn.GoFundIndie.Resolvers.DTO.GqlResponseCodeDTO;
import com.IndieAn.GoFundIndie.Resolvers.DTO.User.UserGraphQLDTO;
import com.IndieAn.GoFundIndie.Resolvers.Mutations.*;
import graphql.kickstart.tools.GraphQLMutationResolver;
import graphql.schema.DataFetchingEnvironment;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Sl