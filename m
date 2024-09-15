Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7965B1C68A9
	for <brcm80211@lists.linux.dev>; Sun, 15 Sep 2024 14:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726408878; cv=none; b=ddl3MuZk77sgJMGkGefuYD4EvuJp3ieWWQaJEouw11i/ltk1jaK85TTv8NV6Qf8+jEr/7vn4XGW+hJ5jjJz6xTttdXDvLUfwWQtRqywLD2Rz/I+FtaWNpJqi10Aw4jp4GfrDW5FzV/qRfvOgaVlGRuZyaiLenJqp/AIHr20jK7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726408878; c=relaxed/simple;
	bh=z1ApUq7/iTxtQ0TDsv1mvl27Cnhr5TF0C9tFP1g9YQA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i+YEOuqfaqpqitlLCB8T9UVFt15RkubG1Gyjql2ErQsJ/yBVbANIVw5HtH01Jp2wbbkw4p1IqUmreNDlo/kWrpgfpvctHS7QHsXcVWA5oj4R8VNOJT5ZxJDppYItmUZ2tidmR4xnx16tU6Ot0/ONmIl/mpABU2xcEbionsgEQcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=TLj/2j8Y; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="TLj/2j8Y"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71957eb256bso290877b3a.3
        for <brcm80211@lists.linux.dev>; Sun, 15 Sep 2024 07:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1726408877; x=1727013677; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ED/M16yR+lXr7ViSvhCHwCaDzEEhUxZQFCnfrZ9b5KA=;
        b=TLj/2j8Yeo4/JDxWltZdn97fZyaMOFfF0N1EALEP0fmCsJV91i+RX1HQ6+P4zm4RZm
         5C6SBBa8nTIwnIh89g7lVrE+l2pN83essyOdT0aSE1180ot689MfgIRXvy4CYPn430+D
         k9X8yShzIi2U+/2QjIuoB5rdCIcr2aYNaDNUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726408877; x=1727013677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ED/M16yR+lXr7ViSvhCHwCaDzEEhUxZQFCnfrZ9b5KA=;
        b=NweWNRDhjszSPsqAQQqdXqEIlN3ZNUwivSjb6DE8hBgSvZ0QeOsoUqC2YZvJZ5/U9m
         IT4Pl18FuNPnyq1DA6IuPmPxzA2mkYgFNN+1BEWdd6T0LlLiDbkJo/nfYrPuaV9prbdB
         g1QJnoUntqGKy928ntMO4zmkQPPn/b9KqckbCBZiibOER3GSPqjztpFECHiZpV1vMXrk
         yRy19yd/4qqED6102p6B/g1q7kPzsJIBiQrMrQB3UGZ5tNX1msqzijCBqvClOJ+Bends
         SqvX1Ri5to1H74e49sCRvR2rNgMav3950Cnr3YlffMgvgMzA5WYDhWg4z/Hwio8jkqwn
         u1tA==
X-Forwarded-Encrypted: i=1; AJvYcCWpKhDLjaYGSN82SICrVgYDoY9Q/n7QWpGIaW+Qm4JJLiA2FpmCyOLS8BWNoSvBEcOILbke0oRZ4uI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyrwFiwI0C5DnJ87CkjKABlv8rpWQR/IglVh9dM+gOV1uazWkHQ
	SIFVmL0N1j9w3SCGyokKQ1cO+ZPmBrK4Fx28HEJ3ry9qsPFahqvE+sJGScKVTg==
X-Google-Smtp-Source: AGHT+IEdpGkkrwoUrypbJYcUTi2/nsbLadJmyTQkulF1t9PMPhNItLGHqbvAYL36nYF1KG7HXhMmAw==
X-Received: by 2002:a05:6a20:1229:b0:1d1:19a0:d9fd with SMTP id adf61e73a8af0-1d119a0da3dmr8912022637.4.1726408876644;
        Sun, 15 Sep 2024 07:01:16 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944ab50d6sm2233511b3a.75.2024.09.15.07.01.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Sep 2024 07:01:16 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [RFT 2/3] wifi: brcmfmac: make per-vendor event map const
Date: Sun, 15 Sep 2024 16:00:48 +0200
Message-Id: <20240915140049.181380-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20240915140049.181380-1-arend.vanspriel@broadcom.com>
References: <20240915140049.181380-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The event map is not intended to change so make it const.

Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h
index 9ca1b2aadcb5..b8c773db8158 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h
@@ -337,7 +337,7 @@ struct brcmf_fweh_info {
 	struct list_head event_q;
 	uint event_mask_len;
 	u8 *event_mask;
-	struct brcmf_fweh_event_map *event_map;
+	const struct brcmf_fweh_event_map *event_map;
 	uint num_event_codes;
 	brcmf_fweh_handler_t evt_handler[] __counted_by(num_event_codes);
 };
-- 
2.32.0

