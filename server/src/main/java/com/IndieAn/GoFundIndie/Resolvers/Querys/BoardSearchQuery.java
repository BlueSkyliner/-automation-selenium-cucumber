package com.IndieAn.GoFundIndie.Resolvers.Querys;

import com.IndieAn.GoFundIndie.Repository.BoardSearchRepository;
import com.IndieAn.GoFundIndie.Resolvers.DTO.Board.SearchBoardDTO;
import com.IndieAn.GoFundIndie.Resolvers.DTO.Board.WrappingSearchBoardDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class BoardSearchQuery {
    private final BoardSearchRepository boardSearchRepository;

    private final char[] consonant = "ㄱㄲㄴㄷㄸㄹㅁㅂㅃㅅㅆㅇㅈㅉㅊㅋㅌㅍㅎ".toCharArray();
    private final char[] middWords = "가까나다따라마바빠사싸아자짜차카타파하".t