Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAC42D97B7
	for <brcm80211@lists.linux.dev>; Tue, 15 Sep 2026 17:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494443; cv=none; b=mPRwLAqNXV4abrlOWIcDQyPMAHrZqhIO70r6NFZofnmUC/3jI6X53xkns1kZNzLT89yMpPWob+z+LjvBSk0VBJP5ukji7TfSVgqX/3qL2RC032xdHeUIbVFQdrz7DEIE8X4/4/fl4JjrAqtxQK+4/FcZRURkX4Yq9HRP5ObbOWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494443; c=relaxed/simple;
	bh=I4KI1aweFFig+SZlrBdaO4mP05yecfWNr+LbmApZG/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qi2/FjfgHtz/J6EVB/mBBdDz+XW7dUs9RYIh4snPS3qgzoqnjQirnFdJXiLWthWcKwwtSHgXcTrvi6M6bpILyLrOGxPxKcspTt8TvbPBhFUsSyZngTdvMnmXy+YcGnkOB3gDJ7U8ohmybuMXCj6DWO3h6+Uv/S3guL/mWgw1/iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pkx5H5PJ; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pkx5H5PJ"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea48edcso34425a12.2
        for <brcm80211@lists.linux.dev>; Tue, 15 Sep 2026 10:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789494441; x=1790099241; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XpMG1qjPop6FoZkaj0fsmzVch6Tcbe08TjxPfHV5ihU=;
        b=pkx5H5PJu6AVll+P6JLnQDjOyQTRrGYR705qAHSV/webSdQyFmJwGTkdQiEd45EJe9
         SRr1A7v2XSZPAowuf4Ot424/UQiCy8WZWDLXqXWCZ1CLkSLf0kbej7hXYTl5msGOjlM0
         w7qrveZzwXxarqnTI+AXYWGuDW3g5y4feV9f5XhTKGJy4bAPtClBaytShYDWkl18KYtt
         DmA+hpR63LecBMAadjUgFSAB2OE1frPzE+ZDSQ4Xptvu0uVwYij+Q1z0HrWKt4Q1nRVX
         Yrvz3LAwjeUKQaAlHAWIHfRA/ai1sqkJHbfhwTUPtamTREBS2b/EogRJT7VX65zthHks
         kQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494441; x=1790099241;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XpMG1qjPop6FoZkaj0fsmzVch6Tcbe08TjxPfHV5ihU=;
        b=GSBi1QFItP6XQgJwIuFY4sKf9iZS9TPBZiUwvcGKAS46yL67AzGX8YW1oR+s1bLL1X
         VUiFrIljEWT6lzj9nvrCQnB7QJfRaDj5swQZJzyg97UFrwW/cHK9kMqz0p2JaRvidF0x
         hiWPGzokpjRtb1DnjLwRVLo1LZyhrIqc4lbzLfHpWJHLewQRfK0iw/6LuJJxQiRtu18q
         6sKT8X9HUaGS/7Y358JhITIX41cOX/Aq8DbqC9kS4QVokrsaYB+wpLaiJo8eDUKJqgKF
         5whpNE385cnDZLCJlJ+t4f/Lz/vq1SBPGvI0Te5hY8ORSsLCh96yNPm8iTm9Xs2pCG84
         WyBA==
X-Forwarded-Encrypted: i=1; AKwUvBys1G4h1+WIq2u1cjI8WlDbOP8daXNJz5GZJKlWXUcOMX4JNa+GUJIAxxc6k4ESCuVk18NU3e4oWRQ=@lists.linux.dev
X-Gm-Message-State: AFuF++lvI2aD5QldoqIP3pXMfvKG2r5rrAGaf7KHplbqVoLeBmq1vxG8
	RK6BsvlXMCAk4QYSe3WgnK0bCfOx1UlGFyp5cKuyO4cq7NuKpjN1JMKf
X-Gm-Gg: AYBFou3tUhVyxtOQBFiC2lSP3LGKoFlWdKjckRR7ApBObUG8Hw6cYVL1lAIztOqkW4O
	r0LkXJI9DCHAV1GqyPgG8CmXOXblc6juTN2sDRaAG8sFQDJ7XZ/Oz124+v0vb92+1z547X90B1R
	83FOdAd1fcyMG0LM5mtvWz65mEL4o6j3oqbehlv8e7z45pDIBA5uBdF9GStq2qAk5sHNygwbNhZ
	wKT9oKELZocdpkgHUnf5fyOMx2SsmkiEo712yThOLntKjH7WxYcGODtQpZZK2QY7SJForPJI+u2
	pn4Y/JzWQtGTmNIubAUYeljU9+HV0AOOquYp0quLM8HZnHJRsAqwcqmpx5je21I1iLDLv7KmM2a
	yy9Q6MdyT828f0KDwubujq2K/WZ+p0C3vIPWGKW3v/V+R+tmrxVf9i8QG6TkPnVTAkCVTZTBTlf
	GH2tFu8FWgDCjcIvy/GYoMrPpk+7LkOhYdE9IrgM1eq4xW4DeB9GkrwPpWPHOMA7Ob1go1298od
	fmD+sUkxJlGE3W1w0dzDJCrBIN7IgKfGg==
X-Received: by 2002:a05:6a20:6a11:b0:3d0:ba81:79b1 with SMTP id adf61e73a8af0-3db400361e3mr16492369637.0.1789494440774;
        Tue, 15 Sep 2026 10:47:20 -0700 (PDT)
Received: from macpro17.tail61d16e.ts.net ([2804:14c:7bd0:701b:a9d3:4f15:11fc:30f5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aca3fbsm545337eec.20.2026.09.15.10.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:47:20 -0700 (PDT)
From: =?UTF-8?q?Vin=C3=ADcius=20Ramon=20Fontanela?= <vfontanela@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: arend.vanspriel@broadcom.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	=?UTF-8?q?Vin=C3=ADcius=20Ramon=20Fontanela?= <vfontanela@gmail.com>
Subject: [PATCH v2] wifi: brcmfmac: allow ISO3166 fallback for BCM4350
Date: Tue, 15 Sep 2026 14:43:00 -0300
Message-ID: <20260915174300.28363-1-vfontanela@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914200357.1743468-1-arend.vanspriel@broadcom.com>
References: <20260914200357.1743468-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

BCM4350 devices using brcmfmac on x86/PCIe may have no platform-provided
country code map. In that case brcmf_translate_country_code() falls back to
ISO3166 codes only for chips accepted by
brmcf_use_iso3166_ccode_fallback().

BCM4350 is currently missing from that list, despite the adjacent BCM4345
and BCM4356 being present. Add BCM4350 so these devices can use the ISO3166
country code with revision 0.

Signed-off-by: Vinícius Ramon Fontanela <vfontanela@gmail.com>
---
v2: resend using git send-email to avoid line wrapping/corruption in v1.

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 9d8ce7bb0..2b819dbe6 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -8076,6 +8076,7 @@ static bool brmcf_use_iso3166_ccode_fallback(struct brcmf_pub *drvr)
 	switch (drvr->bus_if->chip) {
 	case BRCM_CC_43430_CHIP_ID:
 	case BRCM_CC_4345_CHIP_ID:
+	case BRCM_CC_4350_CHIP_ID:
 	case BRCM_CC_4356_CHIP_ID:
 	case BRCM_CC_43602_CHIP_ID:
 		return true;
-- 
2.55.0
