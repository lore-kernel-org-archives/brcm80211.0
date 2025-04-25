Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9E0215198
	for <brcm80211@lists.linux.dev>; Fri, 25 Apr 2025 08:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745570726; cv=none; b=R/htK73yr+Vow00wZeTiJMDZsGkVr+QwcPeujaukEgR02RLOdsJkO237TmcuKczF2Q+ggDWCbHpamYWP638MSEttHHhoB2LhlmmWi8ujRkYesevbmz9gFxgFNyxSUEYciemEdvTtx1QjoF/csziok/fplklP2hkh8+vzc/TSrWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745570726; c=relaxed/simple;
	bh=e0XX8DohJ6VA0/cNyZXvWggjah+MHvEtyETKVHlxyO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pq+Vbzk5rF1ndbnNDH8T3n3Y8o8B/cO2dTE0SNU+9w7W4GxSzqFMTOOeJ+hFNOTlE0D8BMupmPM29Zq12u0ykaqXFlMlld2yt8unYizSXxn66CkQ7PEIokBy58ojRAVjtDqGG/6ds/MWB89j+1Dm/K/eUpPxMGYJDT0wBU5Gsws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=cfZI8U6E; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="cfZI8U6E"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-227c7e57da2so16556065ad.0
        for <brcm80211@lists.linux.dev>; Fri, 25 Apr 2025 01:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745570724; x=1746175524; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UZxtW3kPc6nJSgpcHu4czu11dbH1HDpqjV9mIbR79E=;
        b=cfZI8U6EoONPL44+rByXQUwFIqJ8u3uG4gSa/6ySM45VAzk/lxyudgJTHTltP+Bh3t
         Hvw7KMjbsBb1p7mw+9o5NCZO9COaMrir0nL1qAxVzgeV8YCub9Jbd4MTHCm0MQWl03hy
         XD+QNy/7qqVBIV0JbOngqLJQNW6B7QoCHGQto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745570724; x=1746175524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UZxtW3kPc6nJSgpcHu4czu11dbH1HDpqjV9mIbR79E=;
        b=umfOsoULV3kdF1oYTqtvwp+7mk6TbSZ+yRG76ZJ85g4Yp5DlIrS5by8WkvtXP6a3w+
         d07vsn3NJGyHrSZPQ0AQ13i/UdLbgCVQe2+ZGZKEJgkOUzAXcc1EtvV/X8i1duwreu2p
         z4MIKUHXXkitoLXiCEVlDscEmWE0InFn4hFnGwYRotFMp1BryWBQ815Jm1L8HzZE9PRc
         nY33JKsq9G9Ze3a8IUsoc0tTPhvxuy5adoAj7Ie5nEBzj6ktnpR3BGy9CgpNFM018ve3
         u4q3IjnigJE/8lpoxntwONp4mrgVAvEeIXyiqBK1n2Yn/t1GFHhU5sXpVIAAMb/USWs4
         5ygg==
X-Forwarded-Encrypted: i=1; AJvYcCVdtYeLklC1eHLbCWLwCrZcEufLa5cIWY6/IJ1rwVFgytt1TUOyQFM9nvqHKCAFdKJpHt8X8jgdYG4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwU5GfvuTLzKt5EASV9BBnt3jpLjMuC8+n4I7emnxKu7VbaIbqX
	wTonHOmsV5750Fth0+yapo47BMXmNZdXMwfx4HesjYiQzxelFjQRPPfMDWaEzA==
X-Gm-Gg: ASbGncuUfW3Gp9ZE8aJb46Helkevwo2fhppVHuiULhDF/L3TUVBYiLvMPeIzf6Qve7T
	3GDfBxRYCejolNZ9NbJ8VLzujL5MvsnCcfbbq7uMAn/d5UP9W9v1L0tKez+PFgchgiL5RNZpz2j
	Be2PwOXqBuDSaTPOJ42nAs7kSzhaP20BFqusNzDafx2RO/6ZWUXObS+4mRK5thjtojZcGaVKAyo
	P2u24vNnUvoMLHqF41WEH6u4WN1QkK3hn9Is/SKr6/tjmNGNX/Fe6//++Tso2TARJkOSpNzQxfP
	vL/Kft7BBsiaV7ZSL0uZHqwYh/oMDLAht1spQ9tPnVjYI7bTfa7o+BaDYP71ZVMDRkH4s3HLjnu
	A1/MphzuHR59todtGoqtw
X-Google-Smtp-Source: AGHT+IEnj4QYzpVB6HHq3I6wqUH08a0ZpDspLpgUhqj3FZCWddBKMi+iXpwHZbHfGw23vUzS+X5Dvw==
X-Received: by 2002:a17:903:3bcf:b0:21c:fb6:7c3c with SMTP id d9443c01a7336-22dbf5e03cfmr20862325ad.17.1745570723732;
        Fri, 25 Apr 2025 01:45:23 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5102ddcsm26883665ad.190.2025.04.25.01.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:45:22 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	James Prestwood <prestwoj@gmail.com>
Subject: [PATCH wireless-next v2 2/4] wifi: brcmfmac: make per-vendor event map const
Date: Fri, 25 Apr 2025 10:45:03 +0200
Message-ID: <20250425084505.491631-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.43.4
In-Reply-To: <20250425084505.491631-1-arend.vanspriel@broadcom.com>
References: <20250425084505.491631-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The event map is not intended to change so make it const.

Tested-by: James Prestwood <prestwoj@gmail.com>
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h
index eed439b84010..38a9138f1fd3 100644
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
2.43.5

