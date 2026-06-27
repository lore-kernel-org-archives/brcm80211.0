Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6AE3AEF3E
	for <brcm80211@lists.linux.dev>; Sat, 27 Jun 2026 13:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782566000; cv=none; b=BLT7Evu/jCntntYbror8HPyhVMNJWDDWkvp9+CKNprfV6liCRv4rPwW2JpVucuERHOi+i9D+4EXmfd3kKIz8UtjbvCswMolwet9fC028UI0TiJzkZghT2HaV7zNw1oUK3cKaV1TwPQjvWWpVeyw+CzK01jspzHpeLNE3cMzA8w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782566000; c=relaxed/simple;
	bh=f2ywcAbauLIdDjioz7BzOI400RSnqiFwtqHAuTE1ASM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WYGLITjuMY7rKQqEQQ2sznhc/x7o6uRwhYTE729ZdH2Y3H9PCIAaK4IkhipyMuci+DTSVWz3RM0erLcKn992wNOt40duFFJ5jBpjADY3X/HPsteDt4uHeUT63Fy6vRpQ3QxNTs4aDXBL90mM+CDhYXLMO3cFjKrg97n2bhUTJMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGl/2vBU; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGl/2vBU"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-37df416c44bso1089206a91.2
        for <brcm80211@lists.linux.dev>; Sat, 27 Jun 2026 06:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782565999; x=1783170799; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ffzVDWTdghBqGnNg+yPYLtmRZ4dadK7EfCKOcmYolsQ=;
        b=NGl/2vBUGX+ohGomSOnzCotYmClFBASoHeW7/pOWOzYJG1J2tTq0frIIjxQ8Uo/Kq4
         zeWs4af1+eJBR5SXx1bEw2i5U4swdTbC1EqomgrNuLfIDMk3uZT9hy9r70MvNp4zmqX4
         LCD2Y51Bo0rugwAoSOYqyBmOFTSKC8k48LZDEetEwnnmdaOLICfNtaOLnnuSjEt3Ai9C
         CU+fxVARTSH5dD3M3zomVwWjtfeBihYPDEuJb3Q1o8pkJVfGm2PanQ9faV991E95CeTz
         Vgn3s6LnqNJ6dWhQh+3PVKBo5ftn2YNwbDuxBYztnm3zLbl4+JhVsFYjfdYXhdXINIAB
         6CAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782565999; x=1783170799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ffzVDWTdghBqGnNg+yPYLtmRZ4dadK7EfCKOcmYolsQ=;
        b=WQQ+lrSZNNCGnGl20gxQF26P/hk6Uo6OSGfKnl6nfYDi82Wio9y2KyLJNs2OMJBGc9
         drzPCtogtpICqezvjjIOQVuBqQZ1o2hk4ewq78fjiz0SlNon8l/DaBexxS6Z2E6Gmb+c
         y8xm+Z5hE5D5gTgJkJ9czJIE+3dWAsJZYDXFiQZK9ZVPUM73HrBF5MIu1ZDYadDY2IHX
         uwiaew430mzkiOWnnTTrUXAKOP4yRhhDrhNqBaeT7CN+lco34cHo6VQDOdWLTgaJToWp
         Z1wh+zKrzfPJgPdDBuQYbuu5ey0xKDA78W9AvTOntOhpcEOgt4+Y0om7GU3wISk/EfHX
         /PTg==
X-Forwarded-Encrypted: i=1; AHgh+RogALoBiUWB4JryZoFvdTJ7A8mqOAITY/BwYFgF69ez2ljUlQQp22ME/WMWz7z7qGYmQodtWdJphyI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3rdtkMAcXSFlIiTrDUbPd+rmsVFvnraajJlbJoTD8EzF/hTVq
	8ZkdYijfOCHPgNMrf/TN9YO12fx0C2zEIE9HWKMvom3UcBELX/GcdcCG
X-Gm-Gg: AfdE7clRiHdzxVfgRE5BGQ3UcQCpcRDgd4Tf5GDbsxmaxKqbRtpR84Wa9gLekGUY37V
	UsBJwUUSr1TvAgVWaQjb3zTqLwHol0ZIit51yfSbs9UChiuM76vQ+iPWH6jsQ9m4A497ynlUq5P
	QdboKct8vSM555uIth7+pldr/uKnuyV+BA7iTu2H4L4yloxJU7ERTsq0iuqyLbn+o1BiDVKrxHf
	qP2KVC8NxUKt68y8uuR41odeAjVsomrxt4VVK9bv8qpdXGyj6t1z+GcKyqc1sDIiaLIidWO3WJz
	9KPwU/luAMB8Hp4rg2LsgmTLS7ro9Rmb7zwsnBMJQiVyBXM9Bt7uaILRhW57HezR9euay+qoadT
	omumDceZqjF6EHvWhWw3xO8lu8oz3zNyKENgyuvYnEBVVEYVo5SEQPkXck3Lk9UZyeK2IzJt3Sf
	ndiSOapxirQRdGbJuT8JvQEtqUcbaXv3GZcBMBhwVI+AuXJqWp
X-Received: by 2002:a17:90b:2244:b0:37f:df85:272f with SMTP id 98e67ed59e1d1-37fdf853de2mr240302a91.19.1782565998696;
        Sat, 27 Jun 2026 06:13:18 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e1c93272fsm2598840a91.14.2026.06.27.06.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 06:13:17 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Maoyi Xie <maoyixie.tju@gmail.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Kaixuan Li <kaixuan.li@ntu.edu.sg>,
	stable@vger.kernel.org
Subject: [PATCH] wifi: brcmfmac: cyw: fix heap overflow on a short auth frame
Date: Sat, 27 Jun 2026 21:13:13 +0800
Message-Id: <20260627131313.3878893-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

brcmf_notify_auth_frame_rx() takes the frame length from the firmware
event and copies the frame body with the management header offset
subtracted:

	u32 mgmt_frame_len = e->datalen - sizeof(struct brcmf_rx_mgmt_data);
	...
	memcpy(&mgmt_frame->u, frame,
	       mgmt_frame_len - offsetof(struct ieee80211_mgmt, u));

The only length check is e->datalen >= sizeof(*rxframe), so mgmt_frame_len
can be anything from 0 up. offsetof(struct ieee80211_mgmt, u) is 24. When
mgmt_frame_len is below that, the subtraction wraps as an unsigned value to
a huge length. The memcpy then runs far past the kzalloc'd buffer. A
malicious or malfunctioning AP can make the frame short during the
external SAE auth exchange, so this is a remotely triggered heap overflow.

Reject frames shorter than the management header offset before the copy.

Fixes: 66f909308a7c ("wifi: brcmfmac: cyw: support external SAE authentication in station mode")
Link: https://lore.kernel.org/r/178214417708.2368577.16740907093694208834@maoyixie.com
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
index ce09d44fa73cf..873754be5174b 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
@@ -293,6 +293,12 @@ brcmf_notify_auth_frame_rx(struct brcmf_if *ifp,
 		return -EINVAL;
 	}

+	if (mgmt_frame_len < offsetof(struct ieee80211_mgmt, u)) {
+		bphy_err(drvr, "Event %s (%d) frame too small. Ignore\n",
+			 brcmf_fweh_event_name(e->event_code), e->event_code);
+		return -EINVAL;
+	}
+
 	wdev = &ifp->vif->wdev;
 	WARN_ON(!wdev);

