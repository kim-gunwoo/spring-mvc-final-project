package com.nyngw.environmentSetting.planPublicRelationsSetting.util;

import java.util.ArrayList;
import java.util.List;


/**
 * Excel 파일을 읽을 때 옵션을 설정하는 java 파일
 * @author pc07
 *
 */
public class ExcelReadOption {
	/**
     * 엑셀파일의 경로
     */
    private String filePath;
    
    /**
     * 추출할 컬럼 명
     */
    private List<String> outputColumns;
    
    /**
     * 추출을 시작할 행 번호
     */
    private int startRow;
    
    public String getFilePath() {
        return filePath;
    }
    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
    public List<String> getOutputColumns() {
        
        List<String> temp = new ArrayList<String>();
        temp.addAll(outputColumns);
        
        return temp;
    }
    public void setOutputColumns(List<String> outputColumns) {
        
        List<String> temp = new ArrayList<String>();
        temp.addAll(outputColumns);
        
        this.outputColumns = temp;
    }
    
    public void setOutputColumns(String ... outputColumns) {
        
        if(this.outputColumns == null) {
            this.outputColumns = new ArrayList<String>();
        }
        
        for(String ouputColumn : outputColumns) {
            this.outputColumns.add(ouputColumn);
        }
    }
    
    public int getStartRow() {
        return startRow;
    }
    public void setStartRow(int startRow) {
        this.startRow = startRow;
    }
}
