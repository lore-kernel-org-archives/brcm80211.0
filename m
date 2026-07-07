Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1513A6EF7
	for <brcm80211@lists.linux.dev>; Tue,  7 Jul 2026 06:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783405921; cv=none; b=JpPwnOf7YG/7orDnU0dDf7UmjEfETNI+3+NQDxTfAzGInOyH8p8wMwjydXndPoEFMIL6HlztTOMu2q9mrlaNRT05Y1f+0Mhevifd//zudVO3vZltHJrXZkkquCfAt2scpPOPRrvq+WQm7G8oIAUf/0x9KefPdwrjSbPmkanFnXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783405921; c=relaxed/simple;
	bh=gw6xFYJYCAR7r3OMW1mlW9CNynfkcU5mRcTEYY+hBLc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KeY02me57Hyc2NnFqVOCsr29xEKyBz/kaA7ACczZmcZj4/t8RpdGApn9aX5GtG0GaIDkOnErWdpoOQ3Ibpac3PeyCxFi3LKdud4qkr5FVywgbrxXAKV90h8fmK/NO1tu+6ETl3mzeST0hJZkiQkyG3IReC/JWFI2md33AEjlwyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNVvS5ss; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNVvS5ss"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cab973140bso46236265ad.3
        for <brcm80211@lists.linux.dev>; Mon, 06 Jul 2026 23:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783405919; x=1784010719; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RfgU9SSdH7/Owo5T8p2cLZ2UNiUdFJqsqDkLIOmhzsg=;
        b=dNVvS5ssrf/NixqEkF28nN+cWfWMefXLYcsPokkv5xJ9KZvnnI2xcBBQwpWEfMH0Wk
         oS3zs61VUEdXzZF7fS/fme9j7oLAXdZHGmUdByo2lkLEFQxv67qJtnYoR3+qjvHKYn1b
         hbNGgimXkDK4eM9IouRN4ZQJe81NVjnAHcXXilKDOURj652Ma/E+01X0w0VsLs0SIOO2
         cJ8glV9JOQrmd524Bef47auj438/KV/xzwFOuGkZDDnkgisbxQ5IUFfZsgezyrI192jT
         usn5B0tM2Of3pN3j1Z8XhjOjaduRrACXH7u1c5bET8TUmy+w7nmi/KCOseyTc3Vwblkq
         rs1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783405919; x=1784010719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RfgU9SSdH7/Owo5T8p2cLZ2UNiUdFJqsqDkLIOmhzsg=;
        b=G6XmD/kWIgkvXGtFBxCgNXYAwfX8P/y9vTwYFbynfDnCt6NXPWvLTw7IndNWoKkriW
         NAD76qYh2QWfk913QBsn9ouf6HnD3umwvJlUMQPW+LhkEDV/SKwi/rWb0eD4tYwIbyq2
         Gl7zmLm/+F9ECyBcLBDcPtWo7QKoCrdQCrMCTwxvuzFJOLxlpgxAP3wG00gVLWzxwdbx
         H6UbQKpi1cDDDITUZG06GgyvblQSjO3Zf+Vp8k75ldrabE0xBi2NPnvop9Z1IcIRqLPI
         gBbNzFgD+eqFZ6Pwp9Zl/k2dQnSXFbQAAkCugSDCeCqfvGkXpys4h7TEG7C1YeiOe0qn
         W8Sw==
X-Forwarded-Encrypted: i=1; AHgh+RqjjfjHyziVN3s5QMeOIxPIj7bf8HjituY/HlYNY/QywnumhWK97inEi0lZnDCpXb853pqJR9lJoB0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx98wZU7/Azoku06zNrb974KcnAdEI9+NX46zT3s94QYwTMcI1d
	rzW24CyOTjAZ7+5kzVMy5CohVqQ76IR3yvs+BjKCTUZR4E4QJH261Xtk
X-Gm-Gg: AfdE7ckYLTc2J68KY0qzd5ph5tQOlZ6iPYf+ptnaYne5GfsgawU1cCzLoVoMb3SYR1h
	/+kZOITBXR2FjClG6jVEW4lKxNOaMuP7dvVepjiamEsTYxU88UxgRcSQkRhFOBdX4yKdQgzYh96
	u/mM7eg4/blu+pKEy9Sypuk06pxIc2jqVqNFf/XQ3UdNZnpAI/uwt9RIu6dIOo+IW7JlMMBVWTh
	pbH0zEnZhVFDRrvBgBe2ncVkm8EMglCoBDX8fVxUNw17Nhn8M1PFVElp2NiKR5SZoaSMP//Fpo9
	gcBUfmkcBPAB152puBvxP0oDsxlTAkIYucd4S1Xv94o5Yzw/5xdOqA0v121Dgpu6wrnqZKIhV9p
	vdddYkRuDax4OslLlJBPqOznMBjRKrP3/PGZR+BbXYemQQcqdXZST8w/o3kKN+z56m/+q262fOJ
	mDV4UT33FhJp2sGGqlBtiyqU+4LtxTFcS6bmCRbxGpLsRi17aB
X-Received: by 2002:a17:902:ea12:b0:2c9:cb1b:64d6 with SMTP id d9443c01a7336-2ccbe7244b4mr39876205ad.19.1783405919194;
        Mon, 06 Jul 2026 23:31:59 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d60da9sm5820435ad.84.2026.07.06.23.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:31:58 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] wifi: brcmfmac: cyw: fix heap overflow on a short auth frame
Date: Tue,  7 Jul 2026 14:31:55 +0800
Message-Id: <20260707063155.3099999-1-maoyixie.tju@gmail.com>
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
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
v2: drop the Link: tag (Arend), add Arend's Acked-by.

v1: https://lore.kernel.org/r/20260627131313.3878893-1-maoyixie.tju@gmail.com
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
index ce09d44fa7..873754be51 100644
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
 
-- 
2.34.1

