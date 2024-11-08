Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8A61E7C2E
	for <brcm80211@lists.linux.dev>; Fri,  8 Nov 2024 12:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731070592; cv=none; b=EfWZoTFnEZMPzu9g9bRjv490KLsFaCeTL4UblMXeUWil5o3t5QL+EI1cMWqYdAgcOnb6qyrcUn0PXkeNVRZRNAFkBns9UafzkKHv8Mz71lz35PFngeouFI5Tn4EJ+eVf6fSRDb+PAR1DEhJ0uJcSquuUBa2enK7mrqkbkOPTkrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731070592; c=relaxed/simple;
	bh=hD3Y4qFa/J+cr4HJW7f2yt7j0/IUkwG6u7HeJERV1dc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h06MZre47OaajeqM2unmEol9zsqPOIhFMjq0x+kazJSPr/752LxlhX7waPMRXfR4iU7xZNN00ITGFH7IL4ByM3Pu0kvwTKhoX3242Ax/aW0Xx/Jz93rRAe3fiGsEVDwRAGW3jzAGRQLVGp17ktGvx0G2AMX08pgvyxXWJHDoqHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OfjXYVLk; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OfjXYVLk"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9a850270e2so360629666b.0
        for <brcm80211@lists.linux.dev>; Fri, 08 Nov 2024 04:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731070589; x=1731675389; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D0joV1BmRCBv88D0p4Iir5SGSAXsE60E5ZQGw3bVuWQ=;
        b=OfjXYVLkzSxjxKpfA4SQEqEbOBsA+ecNGvsAQdon3UBNJB4q5eV9u1buFG/acVZiNP
         A1An08JGMmi4mC1HTDwc18CMV4mtPGqvNHs24mRu2Gn+fylXZyRVJcrkHEaht6/96yCB
         Z2j5IIC1yonevydbwpnOaqkQ6dkbzn3FurDuUm5MzhXXuMvrM+zO+Be1ftyIDBuaTtYX
         kwHeTLLUviF/fEhk5bk2/258/A8H47x1Byzt8ZTZQtwhnv4CO3PR8srqgGGtqWxA2t+4
         Drb5vYbE5nkVHaCzl2VQ9NmLvmZjcWFhlItfW+xp+d6of0a0uO+RgNZUunlYR7tT7EcD
         iiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731070589; x=1731675389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0joV1BmRCBv88D0p4Iir5SGSAXsE60E5ZQGw3bVuWQ=;
        b=LIlT05IPtYHgG3mLsQoWrtsjRj3QgK1iL4XfJGr5ZrprJEdrpa8PAxszkCTPsnwyAR
         1nePGhS0VidL7ho1XeUZ1zcEO2Xwymv3ZiPQaO9QO0jdfyFZnSlPFz11meqS6tbxLJ08
         BdxN4CHUNsBKXiJj3PHBGmLBG8bnyXqU9e8j7XaA9eqS2PouPmYOqXWWJmzmzOjdljeI
         /25DwWYY85BUFZHSScHwcdMK+GLij8FA2XU2uzn7J+5vmYXx1+WKcXxR+Ppti0K/cejr
         KBf957T3ony2UQE9e4mwlAxit9k2j0zfdzB9+7pxMV2sg4qCQB6oKG7ek8J0HZztfJ4U
         Kxog==
X-Gm-Message-State: AOJu0YwMnClF3E0fQJyrN33dTScbkgoR7ahrMkbQ2vkoDxjStb8491HM
	f5BrHwCGuze80JDRyW8/gCcpNfa/sfhAeo1a9W1zwi8YPcIL1rx9caklSoE5uIQ=
X-Google-Smtp-Source: AGHT+IHPXoPd7Z4KNLTQ2FZog6p2rMAeE5YnaCRsmCQCCLDAj8qdUPS6wrUQX+D21pBuwSuQ13sgMQ==
X-Received: by 2002:a17:907:1c98:b0:a99:543e:94b4 with SMTP id a640c23a62f3a-a9ef001909amr225544366b.56.1731070588951;
        Fri, 08 Nov 2024 04:56:28 -0800 (PST)
Received: from wlt.home (77-165-185-46.fixed.kpn.net. [77.165.185.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a4a7d3sm229584766b.70.2024.11.08.04.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 04:56:28 -0800 (PST)
From: nvbolhuis@gmail.com
To: brcm80211@lists.linux.dev
Cc: linux-wireless@vger.kernel.org,
	kvalo@kernel.org,
	arend.vanspriel@broadcom.com,
	Norbert van Bolhuis <nvbolhuis@gmail.com>
Subject: [PATCH] wifi: brcmfmac: fix scatter-gather handling by detecting end of sg list
Date: Fri,  8 Nov 2024 13:52:30 +0100
Message-ID: <20241108125609.107016-1-nvbolhuis@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Norbert van Bolhuis <nvbolhuis@gmail.com>

The scatter-gather handling uses a pre-allocated list (with nents entries).
If the driver runs out of sg entries it will result in an oops. Let's detect
this instead and make the SDIO block transfer fail.

Signed-off-by: Norbert van Bolhuis <nvbolhuis@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
index 42d991d9f8cb..60eb95fc19a5 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
@@ -455,6 +455,11 @@ static int brcmf_sdiod_sglist_rw(struct brcmf_sdio_dev *sdiodev,
 			if (sg_data_sz > max_req_sz - req_sz)
 				sg_data_sz = max_req_sz - req_sz;
 
+			if (!sgl) {
+				/* out of (pre-allocated) scatterlist entries */
+				ret = -ENOMEM;
+				goto exit;
+			}
 			sg_set_buf(sgl, pkt_data, sg_data_sz);
 			sg_cnt++;
 
-- 
2.42.0

