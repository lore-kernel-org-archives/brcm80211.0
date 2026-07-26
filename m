Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663F1375ACF
	for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 19:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785093975; cv=none; b=g8GLkJWy1L3kX1Iq8e0cSxqu4sM/kP/61Pr4MXvsMUEeOOvBB+k/i1gXngDDwVG2u75Ijd3XicIEF6YoacRtbQZOCnYq4/RAexdG4mLKGouJaH59M/DRhfPZrtbkIxMVF2tCwmw7aD8rBzk5u0q7sVESd6LbR8gaURL1BMZ1Ur0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785093975; c=relaxed/simple;
	bh=YN70RHjCwmQ83vx3SX+04RYNQVnGpUEZQcVazfzYY2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ceiK9Ec/1IngbxC0v5fHXiIPSJA5BSpWXLAzOYFI7y4ZC3JSHAr5Sisiw1sbwZEaQSLvFhEPezEG+HOo8mzB1TTWC64abLdzUrvBMXzhV+RyX3k1JrFiN8+2Vo7980ClcZ9/jatH4feWQ7v7UrHb5gBl0EOI7yA0+hPU0Mjpgfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XBmb7S30; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XBmb7S30"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2ceaf8a1265so24425195ad.2
        for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 12:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785093974; x=1785698774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9mAAQLzPAI07RqkNYsgKLJ0dCN5z/oc54+anUQNCXX8=;
        b=ZaeMbmBWj6UDtiwQ0yH1mS99qsncCWh9YGzxYr6vwQPz+YetFTD3X0gwJ4UJW/O/Bw
         zSZelDBg1YaxMPttlorXFr+VehyXRZonRLVp2VGA7Uxa1I0xNPvVMkBFPwVIv7QHDWCs
         xaznIre1kq7Q+LSv4JJUidSOQtPXwLKH5scn0J/vLsjrDo/2BpDunEqQJ8gSzEi6sGLi
         4Zr8Yps/6eDJqky2CYiJ0sZ4xeLunyozLRlrWCN744CCBFT9UkIXOjwPGEJfHm5C9guS
         beB/XTSKyTb0uD7YfEcGxC8hcK2ZeJAkv3Il7IPTqSLjj/+qQu8iqfHTeV3dMLGieyaG
         CiWQ==
X-Forwarded-Encrypted: i=1; AHgh+RqpO8Nq9w1Rv4oqO8NDhNlOHzEBBRSarAwcunKnLkKY3fNgmzZ6iFH2JIDCy6ZfK6ykW+1p5k92elA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGDgNgbTzOdD4mukmIiltoIzyN7LWm9gPv5+VAwqENZmHElyLu
	bvkjuBOwoKBhB8MCxGv25v47D03bvTq8gYvAJekJCYfmR0sXWUQBKd3jb+jOh0aLf9Qbv/+PRt3
	u02KwlAPvHEJ7ND2sq+u6COTcyvHqWWhtImKPlURWJ7sF3kQNC2apKOseu4mPLNWsoxaAhzZVGt
	s4prlSHcbF5glorozfmnUvU5ooENsF6+lHj86Q+Ps6BZN81MhAbMMU2M+2UaybdR9a/84a49Iki
	L/fU+RHQ8bD1d+7e8l8iw==
X-Gm-Gg: AR+sD13w8R0rMF59xR32jRCOgci6FYemMegdP+GQMTc/iRNlZ1k52Jf+Wxj7xj6sbYC
	nX+S8uNgKlABV/Ms8dPy8kMa5s03Nyz0Y/FK13T0/sW4XeHQJU1RHpOd6gZ13sORzsY1kVHUTfd
	5MjviT8Ax8kT60ZqrWo1CiZSpPTSFR318r3f8GIZ09rHpb7Ui4At2Z4w3q+859OpZKIoewFab41
	msXAdCtDiEH0qehnLBNrQIG09ZgwKhu8YCjoqNFLx4tguEQv/VEIqBb4lPwuWwHbk2VLKoC3Alu
	c0PAxki3xyzFuu4U9Gq4yYtvmBkCAoaMIORXZWoZy1wX8/WlYIFDwXANA/4p8ctRZSJrI0JOVzz
	7KsELeKR7vWMQ+anIixe/Kv8DF4NNKJoU+0vcuow6yJ/CCeaelcBBMHxBJPGRwDgMSh3ThrCOtx
	HMgfiBwpyTNJXaPh/n0VbMiX0AaumeeFSNwWJRGSI=
X-Received: by 2002:a17:902:d98b:b0:2c9:e86e:aa0a with SMTP id d9443c01a7336-2cfde54fba0mr55278795ad.0.1785093973812;
        Sun, 26 Jul 2026 12:26:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-73.dlp.protect.broadcom.com. [144.49.247.73])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2cfde7b2395sm5750385ad.44.2026.07.26.12.26.13
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jul 2026 12:26:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89704da8c7so2813534a12.0
        for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 12:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785093972; x=1785698772; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9mAAQLzPAI07RqkNYsgKLJ0dCN5z/oc54+anUQNCXX8=;
        b=XBmb7S30Jl792d6BtLlXYxTFj5snApTmVCQDZ25bgW9r27oZnD2D6CLybqriUxiTKx
         UIzwql5jEwzyo1nmGvUiTK4f8HV/Xxvj60YWWN/rgpL2Cnj0j7ucMB0vGA1hOY3qkyoM
         4iKfY6LDsYNfbfZiI1FYBGKXs1Qda+MLgku+E=
X-Forwarded-Encrypted: i=1; AHgh+Rq9L35HgabRbR5job3ey1V0HCUaK/f2nMYdfXo0y2dEx2ZoWQki8LDUlGu8VnucQzdio3FcjQAn2W0=@lists.linux.dev
X-Received: by 2002:a05:6a20:d492:b0:3b4:b340:411d with SMTP id adf61e73a8af0-3c67dd8a3bcmr6307801637.24.1785093971741;
        Sun, 26 Jul 2026 12:26:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:d492:b0:3b4:b340:411d with SMTP id adf61e73a8af0-3c67dd8a3bcmr6307788637.24.1785093971314;
        Sun, 26 Jul 2026 12:26:11 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm38355795eec.13.2026.07.26.12.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 12:26:09 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next 09/10] wifi: qtnfmac: use pre-assigned cookie for mgmt_tx
Date: Sun, 26 Jul 2026 21:25:40 +0200
Message-ID: <20260726192541.2816743-10-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260726192541.2816743-1-arend.vanspriel@broadcom.com>
References: <20260726192541.2816743-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Stop overwriting *cookie with a random value in qtnf_mgmt_tx(). The
internal firmware frame identifier (short_cookie) is unchanged.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 drivers/net/wireless/quantenna/qtnfmac/cfg80211.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c b/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
index 9e44c85d2051..284bc61c46d0 100644
--- a/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
+++ b/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
@@ -454,8 +454,6 @@ qtnf_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 	u16 flags = 0;
 	u16 freq;
 
-	*cookie = short_cookie;
-
 	if (params->offchan)
 		flags |= QLINK_FRAME_TX_FLAG_OFFCHAN;
 
-- 
2.54.0

