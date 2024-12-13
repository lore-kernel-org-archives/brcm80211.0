Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3888192D70
	for <brcm80211@lists.linux.dev>; Fri, 13 Dec 2024 08:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734077652; cv=none; b=jan8OUx0mf7ueg8W/j3Ng386cgESWhd1iqaU+l7quDjCG8E+1WVGa2SrvCsXW/5uIXCV08pyQqJrAYOtgW/iKUrnqTTQSgFO7YbaJnebAexfSKjrV5SXdE6Bh4YWZ/YRjFdGsTXVyzqbaN8Ce9RVqcQOpyv2E0p00BjQ2TRyKdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734077652; c=relaxed/simple;
	bh=DeuTWikIwBDL8XxaGJqSSaBzW8ftzrIQcnnjpV15GrE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UNVyn3WON/NkR/ye+FrmnpojtPn9Sd/s8DqvsopccdKltF7MhNxyIWtwoUovh317Cy4cu3FBbDt9CNPvLTOL5MBJAmRY668WwYsUhvwvFudUVXuQ0PQ27CSiC774sZJLC43qVnVPTXbVI1mZUAW/ENf3Q4MR7Z9+xdPsXKmcJ5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITJujvKE; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITJujvKE"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53e3778bffdso1615626e87.0
        for <brcm80211@lists.linux.dev>; Fri, 13 Dec 2024 00:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734077649; x=1734682449; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kXFXfj7o8MwwmFfKPy6HLkitXoH/KOnee4XhQ59bWDA=;
        b=ITJujvKE1Uuy8NouVknUG4txhqsX1TGyVgAiZNo+35Jq4s6WdKJWr6Ih+FZZj8oIvq
         Gr8xdzl3dk0Rb4D2SAaiF3+T+xJ2QDBkkP+NSyOH6qtFo9AWVjA/x5iMzzjAH84RaOya
         xSFk8RPrUfq5Povn8Aan5Pm0jM1doiFXQPq7dnp05pStn+z7bFGLH/VrTaDVPDc5Lteh
         kYJyafTimNkll+xJ99NZIaTrcqYkDSioO8mOGi5X8Upbb7kIV1WVo9/mYrK3xnLPgLfP
         Ua2u6CCrujf87nvwlkCXCnDbRjCBDZ+MVuH1Gw72KNwkpNHSEocbxXMhDTvqEqkFGd74
         /psQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734077649; x=1734682449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXFXfj7o8MwwmFfKPy6HLkitXoH/KOnee4XhQ59bWDA=;
        b=Er9bjHMWABiM5QNqP1c/XIC1fP9hUl+99hcWRsAyxbQdWGnerqBWMe28/ayFKoPH0s
         +grCkO5xXigOFQdYsKxjOxEehGlwJ+imylm2KQ2+P2TRT6TD/ZbqgF+xNVC9odeFfddp
         z99QZQdzClX/0CR+wuuoEqM7ElpWSbqrfEpy9R2szyUL62jqTU6t5oFvES2iBT9z6+xs
         GE1gKMbQZOVTZRqDdg04OyyEitcRVSSEpDS88cUdMmfc5rX1Zg9sR2+TtQLBSpxcyDxq
         F38eHTjLG6xW1PMyh0j2JB7GaUdUVuJx3hSqBuJspi3UzgjKCte1cBUeKHzi5E4x1P2y
         PiIg==
X-Forwarded-Encrypted: i=1; AJvYcCW+14TR2JjiM/vvZKWM0mmDTyBHU23crDQ89anYF1Gn6tsTAus3TQMo1OoYsYNOPBUx9saNcBFD2QI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyG1XtG2dezYSmfwEp3pKisJSMHAw2694ZfkVSb3ZEzl0mOMgzF
	oYEZazaoFAgYFZSFwnZoAhscseb0P+Oq0ETO4/QC2nefD3SYwzmh
X-Gm-Gg: ASbGncvVYQK1J7BDAS0BsGD9hIpiokRkMJ5Mz1Uu0XJI5Q8sfD0gtzJPv8AYHa5qPtu
	WeSsVnczMLDXO7anV2gOinmWTPXwVDVnh+w/5zhAeMI0lzHDkTsLuIwxSZjBZjGT1znqJJzlDU3
	dpb+xamVsC2LWw+XYhVxSNLUA35GqC343/W0ZPiPAoxv2/UXBLBkk/88NYW5B2EOiiKgwE2trMx
	0mDyipi/qtfkaVy3zyniXNA5frSunQtx/9sQ1mBYaq99r0AyFf2onxgSsRNxs4CeA==
X-Google-Smtp-Source: AGHT+IG5nk114gmKOdKv3MZJeb4DCsyi11f7Ro9alkdACiWlDrzYvWpKnd/qR9uD5+29IvGYRN8Ldg==
X-Received: by 2002:a05:6512:3b26:b0:53e:350a:72a0 with SMTP id 2adb3069b0e04-54099b69aabmr495775e87.51.1734077648604;
        Fri, 13 Dec 2024 00:14:08 -0800 (PST)
Received: from alex3d.netup (team.netup.ru. [91.213.249.1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401a3a4c24sm1822010e87.199.2024.12.13.00.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 00:14:07 -0800 (PST)
From: Alex Shumsky <alexthreed@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Alex Shumsky <alexthreed@gmail.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Kalle Valo <kvalo@kernel.org>,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] wifi: brcmfmac: clarify unmodifiable headroom log message
Date: Fri, 13 Dec 2024 11:14:02 +0300
Message-Id: <20241213081402.625003-1-alexthreed@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace misleading log "insufficient headroom (0)" with more clear
"unmodifiable headroom".

Signed-off-by: Alex Shumsky <alexthreed@gmail.com>
---

Changes in v2:
- don't remove log completely, but reword it

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
index da72fd2d541f..c3a57e30c855 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
@@ -327,8 +327,8 @@ static netdev_tx_t brcmf_netdev_start_xmit(struct sk_buff *skb,
 	if (skb_headroom(skb) < drvr->hdrlen || skb_header_cloned(skb)) {
 		head_delta = max_t(int, drvr->hdrlen - skb_headroom(skb), 0);
 
-		brcmf_dbg(INFO, "%s: insufficient headroom (%d)\n",
-			  brcmf_ifname(ifp), head_delta);
+		brcmf_dbg(INFO, "%s: %s headroom\n", brcmf_ifname(ifp),
+			  head_delta ? "insufficient" : "unmodifiable");
 		atomic_inc(&drvr->bus_if->stats.pktcowed);
 		ret = pskb_expand_head(skb, ALIGN(head_delta, NET_SKB_PAD), 0,
 				       GFP_ATOMIC);
-- 
2.34.1

