Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F69535B7
	for <brcm80211@lists.linux.dev>; Mon,  1 Apr 2024 21:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712008447; cv=none; b=mPRWaeiJevvLoJ5JkJjCjv2vIAW5wptbrPmYD2USRb5d2aaOVgiRc+QK/6koLZAvMq+Paa5GGK/a0+6CcvDBZLCmg0l2/0MZsynIt3jAcTM2cSVhT4XPQRz1g9M3TYr2eOJe2wMs8iBs6WwfMGuP+FlA80CBhZHNqHYCkXBxp3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712008447; c=relaxed/simple;
	bh=Tby9SwNmyiiwFffC8TGSgy7B+o5zysI1sDIz1lHUBUA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=U8ob47F6NRblBaFRuaVcPdKXyy1IEcvqVuxlYo/W5oH9v2RPo+mGNoB5dZAiI48Nlsxw1+EraMFR9MimHyydq9IMI7ddbUxR32M8dj60bqYVz7q108heblVnyjxLrIhKL2EnvSH1ysLAThqfbBxa+o22dwlvLM7jkibl38PhPQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nK/Hhsr7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nK/Hhsr7"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-415644aca59so11712315e9.0
        for <brcm80211@lists.linux.dev>; Mon, 01 Apr 2024 14:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712008444; x=1712613244; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7iUisfySJlUpllNR1rWEURtls5OEygug/FNDU7BTr2s=;
        b=nK/Hhsr7lYGU+XqySlxrSRvgZoI8radlQj3eGhexDNSqdoxRKsujfAHQF5pvtDp7DJ
         iN1tf3pxsFxKPiq9GROcc3aLHjNmppeZubpBTjtFvM2Wc3aecVDR9qloZ7y7VpaPwAj5
         fxqNFE7j1MCUp9Q3KoYXGK1bY7HFmciX/XWfP2lLM159YhqbU1iX2I/0LzM9enb67Cx4
         xAJrSpVcTgh684DW2+xxkV5L4Z8TwF3baIL4WK/HaZPTNJws6wRbjme2VhLbRjFnZBFk
         p53wxfQwQ+/wWDTboOaZKJTsSAbw/XD5qBzlJyR4YShGUAwfGJJcaE0O3VbNKeoaIDc+
         w7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712008444; x=1712613244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7iUisfySJlUpllNR1rWEURtls5OEygug/FNDU7BTr2s=;
        b=Ht8W6zsKNlLrC9/5niiIy/Pbi3/0ci6vtXODGSz/42tbrmttkIpisBAN/OCDZuYXXY
         jtPCCZgQS/GyHduJWK3KguLw3mGDWsR1FaXPaW+bZ8q/jxoLC3zYvMOnMrgreKsYpeIa
         MhNx7G77kBu7L5vmGvSAP+8jzfApiniWm1ANf+Hbs2t+AmWA9wqaC3luDV7h9TB1TZjJ
         C5qP2H1NqrMcq9muz881kgit+8fImQrF22Gr3BXOSkjJ89jDMOySmw3XN/CeOH3mw5V3
         4mAG6mEM1nFU+SjsJfGRdILZrtlai/1BYsv9J9PAOkcmQt1EJwwTMb/QnSA8+mzqZ/z7
         a2HA==
X-Forwarded-Encrypted: i=1; AJvYcCVn/d8mkiWCAvVCjJAcgOzEZHGwclX6YM/Mqizb9GmsBzav5sle2BSMI7MN2rjPOd+uOUP37W81BkMbhpFzky6UZf2cu/PI9LmP
X-Gm-Message-State: AOJu0Yz3Z2qOHXKnvkkaoZM/TP0tm0NosPVor5pSD7/dFHdI2WVD3ACN
	rxejadaUTRa/CLHNAm4dVYMkdNrVCiTuGS5RBEu3aCT7nr5soJ+c
X-Google-Smtp-Source: AGHT+IHW+hjEDlhg1rFNI/CeLAEyX5Id3FTjduFBw8r0aS5TowLPLl1mAVPweSZ8nfwwdF13N0ZmPA==
X-Received: by 2002:a5d:648e:0:b0:33e:c528:c900 with SMTP id o14-20020a5d648e000000b0033ec528c900mr9509436wri.55.1712008443930;
        Mon, 01 Apr 2024 14:54:03 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id di6-20020a0560000ac600b00341c9956dc9sm12506046wrb.68.2024.04.01.14.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 14:54:03 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] wifi: brcm80211: Fix spelling mistake "ivalid" -> "invalid"
Date: Mon,  1 Apr 2024 22:54:02 +0100
Message-Id: <20240401215402.1348565-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There are spelling mistakes in bphy_err messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index b99aa66dc5a9..5fe0e671ecb3 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -4549,7 +4549,7 @@ brcmf_configure_wpaie(struct brcmf_if *ifp,
 
 	if (!brcmf_valid_wpa_oui(&data[offset], is_rsn_ie)) {
 		err = -EINVAL;
-		bphy_err(drvr, "ivalid OUI\n");
+		bphy_err(drvr, "invalid OUI\n");
 		goto exit;
 	}
 	offset += TLV_OUI_LEN;
@@ -4588,7 +4588,7 @@ brcmf_configure_wpaie(struct brcmf_if *ifp,
 	for (i = 0; i < count; i++) {
 		if (!brcmf_valid_wpa_oui(&data[offset], is_rsn_ie)) {
 			err = -EINVAL;
-			bphy_err(drvr, "ivalid OUI\n");
+			bphy_err(drvr, "invalid OUI\n");
 			goto exit;
 		}
 		offset += TLV_OUI_LEN;
@@ -4622,7 +4622,7 @@ brcmf_configure_wpaie(struct brcmf_if *ifp,
 	for (i = 0; i < count; i++) {
 		if (!brcmf_valid_wpa_oui(&data[offset], is_rsn_ie)) {
 			err = -EINVAL;
-			bphy_err(drvr, "ivalid OUI\n");
+			bphy_err(drvr, "invalid OUI\n");
 			goto exit;
 		}
 		offset += TLV_OUI_LEN;
-- 
2.39.2

