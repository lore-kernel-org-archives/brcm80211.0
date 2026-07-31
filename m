Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D6C443E4E
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 15:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785512976; cv=none; b=e0duYpt/sDQQyxGKsosearfFgpmWcbEhEousPxYLtrm6AnCs8fhgYI0e/KkVRZqvBi64U0iyAJQnYZ+j4pfDKXFN12JhVvgEMQmTuQQ2D2PPxWgG3/nFJLC4BYNhikqR7rzby0rAsAEDb1wiCtBWYZSwTT6e/spu1jetBBNyHFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785512976; c=relaxed/simple;
	bh=/RZ3/Y/ZlOJg5G1yVeQGiGHh8zDUuB5gPSaN4Pn9iwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UJJ+gLLgNe6ny914ZHdzpCyZ+1JbqGqiu1mGOc8NASTMmJjuWZF0D6NSnqU32NVzgfGCuwK1MuUeX9nHSWEjXn7evMzCiLfH/PMRGMoxy+iiLMSxOvIbCXPKstU2XBBivsUCheY0cqTP15yWQ0/BI0Gwq8SnXxT0r/uJOCBVlmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oLPk9sYO; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oLPk9sYO"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-384caf7b168so129721a91.1
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 08:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785512974; x=1786117774; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rtE+fcyTa/nEHTvbkkFzvfqX94g1NeErZWdBjlXHpz8=;
        b=oLPk9sYOqBDNdGzwjYsa7m5zekntmxJg1WkpOAW9uae244dTRb9QiI7ayZkFOaCX8b
         TG2W9pABGdsOhFLGOwOLgdFIAGAglJFrP+mGNk/icIMJLNruRW/FYOgn4/Pv5p1HoBkn
         wVDVkWQSShveUyXI9YrNodsX26cH/UEDxgyVJAcLDwddPe/+Pw5zWoeGEVwMefxgyHFS
         zzRFKX25jMuf66COl/aZKgRemIxyjToExKIJpzLNsLZafAVWyj6nmCNWdcCLsRgeYWTA
         YiDINgZ3YIjAobNBKqn3lPbM76J9NCEyDUf61VJUHyhFEb10G2pW51J/Qx/55pSIrwkd
         ZsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785512974; x=1786117774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rtE+fcyTa/nEHTvbkkFzvfqX94g1NeErZWdBjlXHpz8=;
        b=lbWeojLMvHZKbkgs+rCsYBpUh8o+0VtUOc5BS6dKwPpwPUV6vai4dZzl1mUdvF4olV
         gxTbxXEjUZO8bpvNwQEPuN7RW/pZPcDeFt+a1V2obANM77TCEau6Lryo2fBrZpEIU+yU
         eBYcwoD12Y6IKih6n3hwFhy8urxTUFUJoURS3vsTwCXcQHv0jegw+H0qGGQf9ftq4q9Y
         5FOcfBUi1MxEnxTyTlQtzRfu/nRvDP5tR4G0bAbFxNm/1PD4xXDX8lXaVDYS6uuB24jY
         jjSbAP4s1gmCbgvKwEjkPvOmfrvo9xY6pjMKmnkscW/E0WZajbvEYjQLbZvG+2iX7Bb0
         nQDA==
X-Forwarded-Encrypted: i=1; AHgh+RoIUqxLjoQWdCs3US79IyECvFxYNaduBvQko63ntp2CdTOdj+cKAymgXZBp64MdBmwkwzW0umbBsCk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzUDV2Y+NcfAP8YwKhC+vNmnQ/buaO0TtBJU82QSQalooSWhTKn
	s0V/HHH7021KFy9Gpg5q4GbyJJevEEVUTOt71SrUaYRY9HiiHcveEmPL
X-Gm-Gg: AR+sD10fLK5nh7Vjo0wjWgeqqBAgOknXZl3WDj3vwCoRwpbGOrg97rr1fd8E5bQ5a+I
	gm1/N6gQOTTMDRvsgzA3G+IhHflCnFzWmBwz+GuJG7MFngiAhE6hIzGMzze7ZSoL+4IvsBbdcjd
	oOA73iWC94V71CsXm+0ncKZiZz+uOd4umvwIPbcMJbrt04BRqKTmF9LDOGsdVY7x613JBP+kEit
	k+BGxk5VGg3UTc/1zmul1qRDfqvBrDMK8tZmlanmAfjzULFGIlh34YfsJ+/VyFBgICRqHRx3z6T
	9zVSm1GT07/L+eRbyb77JuqXA+mPScwzPK0XsjQ7ySKiGU5C/g7sXjkSFx17dxLgKeNYNxGPJcq
	vRrYX7s2X4EonNpZ804ZLGqk8ZiBwNoMXXg7Ej6+YPnHYC8Zp88qpmbaFi/m+Q/HhE/BJgrGkji
	mqHGtGG77mbqutIJf2au0d7GdnuHS82tSmaHuoh57IuoWq3CwWv7zaGMIlr1aBkbf+GD394CnkK
	t79HqOTCR+VkQ==
X-Received: by 2002:a17:90b:3cce:b0:383:5a16:bd67 with SMTP id 98e67ed59e1d1-38fbc58abc2mr441543a91.4.1785512973970;
        Fri, 31 Jul 2026 08:49:33 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045016sm11852510eec.19.2026.07.31.08.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:49:33 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
X-Google-Original-From: Shivesh <shivesh@example.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <chanelshivesh@gmail.com>
Subject: [PATCH v3 8/8] wifi: brcmsmac: ampdu: clarify standard compliance on QoS change
Date: Fri, 31 Jul 2026 15:48:40 +0000
Message-ID: <20260731154901.1822-9-shivesh@example.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731154901.1822-1-shivesh@example.com>
References: <20260731154901.1822-1-shivesh@example.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shivesh <chanelshivesh@gmail.com>

Updates XXX comment to properly reference IEEE 802.11n requirements
that all MPDUs in an A-MPDU must share the same TID.

Signed-off-by: Shivesh <chanelshivesh@gmail.com>
---
 .../net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c  | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
index fc7a5dd2e5d8..3fd8bdbd35e5 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
@@ -516,12 +516,11 @@ int brcms_c_ampdu_add_frame(struct brcms_ampdu_session *session,
 			return -ENOSPC;
 
 		/*
-		 * We aren't really out of space if the new frame is of
-		 * a different priority, but we want the same behaviour
-		 * so return -ENOSPC anyway.
-		 *
-		 * XXX: The old AMPDU code did this, but is it really
-		 * necessary?
+		 * IEEE 802.11n standard requires that all MPDUs within an
+		 * A-MPDU belong to the same TID (Traffic Identifier).
+		 * Since priority maps to TID, a different priority means
+		 * we must close the current aggregate and start a new one,
+		 * so we return -ENOSPC here.
 		 */
 		first = skb_peek(&session->skb_list);
 		if (p->priority != first->priority)
-- 
2.53.0

