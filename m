Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794769130;
	b=dqMhCfUJdbuxSj/gk6D35pu6tlf3Dk+lojunTuOycOvZSPHzjJhZCSMrXD7ppMR2ZY9U
	 b8QGhAfqgO7Im89ssPzByMpIEhG76/CA3OpcaLNwo8JkFEsHNsGQHJ6bNqbNiMUX/9I4H
	 l7jmp662Swq2ppQ/1tZinUhZX6pX7ZF63PtehjLrEhpNLKA3c9HfmKmc+ppyrHAZaottg
	 QcyhKBchKG+w3dDaJqKtGRkbhG5TRPXhuO5ZebQEeON9gT077F1IV4UTyWbyQSlX3kUjP
	 aJDWdlDb4Zoa+u/STVKQreOhZG8pFqqxn2t/FTPaRfWDJSnRsddYpdN4kfXK81eEufA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794769130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BvKuisBW9st6dv4iYQYmdk7UUIHA5W7Ob6TCeUj4NB4=;
	b=JJfS6lUo36H/HZD7kChRN7haJwUHsWV1hqFMANyys+D0gmSXDUY8TTCtZEgGkSopXkv/
	 VfUz+drhd5WUbkwkDd7ZzNz9K33Zj2PoI9YmC+lHGyLudVY/fULGfNvgu5MP77NYXz/N1
	 XsHizk+FWi3RcOqj4Tn4rZRtzL96WwpbZZzdyLY3s9MVEODk+gAC1L+BlU1Wgr6tosExH
	 v86y1cHAXf3n1d7X9sUuqzQOmZlGmfIv5loe89vVmJGq6dl4uwQsk+7UzZ4jjsGeEh4J5
	 gBpBaX9CNGMf1BgVTyaM/aGu6Dgre6yB2M3TAN0mqV4v4m+CKtMlbmzHb3LP4pRHeBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lw/qct/h";
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B75606A884
	for <brcm80211@lists.linux.dev>; Sun, 15 Nov 2026 18:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27B75606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lw/qct/h
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so3026015c88.0
        for <brcm80211@lists.linux.dev>; Sun, 15 Nov 2026 10:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794769129; x=1795373929; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BvKuisBW9st6dv4iYQYmdk7UUIHA5W7Ob6TCeUj4NB4=;
        b=lw/qct/h1AmQfvQjOUPbqTLG6IZp8Mrx304d7SuRBhCc5gPr+amlIAtcw0Y/KkyBF+
         i04/folq6N3jYE6pCw8ZQJj3mqnYYX0sI7eNSEleZr+LoKWB3o81H3BsbBPGuRLeO0yP
         fM6ugVNeTPV2K8x6f8O+myMj8EyiqOnP2Unxbw/TyaJrl96nLTP4bySfdci/KjqEjTT/
         VNfQqPzLP1XtknV8o1LuV0SuYcu0+3i4bIrDUzJ09IPG9fonJcMQEay8jFUND1kP8L0H
         wiFfDyCH2G1X8s/vw0EYZoDbo3n6MTdO+vts+BzbU3h1Q7Ev04Xe1fCzZqerpkAsS6ZS
         mQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794769129; x=1795373929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BvKuisBW9st6dv4iYQYmdk7UUIHA5W7Ob6TCeUj4NB4=;
        b=vFkO2VoP6cJBDbLt7Yxz+iHTwWL+U9MQzq/0IOsL8cWT3F7ylD66gSgq1GMUqMYhW4
         hwzAvg9HeqOvELgjYuYFhfwEOuYj4oEAFQaMEVmE25SnEsDo+xgZ/FpZ1qetRpJq7nLu
         RBbyerrByomRSZjOnBi+fseDkf/C0E+l4gORqpqBGMyOj9/9Xk/PaO3lBjcKGIA5uCsr
         3cYdV692FVyKbTeoxTYRKZVjYoTOt/H3WoweUIsXR4F9+ftQgmPyuwXYeJkzjyaakGAn
         E/HvBwvZf8M2GKJv2grTs2Qr5JQHmRNJwArL1o/nbdpfqgyDqIBh4G//xQSvyxJ1VZDv
         lphQ==
X-Forwarded-Encrypted: i=1; AL+hErEBfBl1w1kLDwrwdmAtq5bCNQLxJFrSQLq1n63m/e7ZlYWpWKtdNEYaWesBeO3K1G4H5oxnHBZIKUg=@lists.linux.dev
X-Gm-Message-State: APuU4Z9pg++PO0MX2Ma+bnCO0Bl4a46/NljX6RoQvn9+Ze5ikO/758Km
	8pFyLX7URL7ZhQcDLZnWDCntyHiWLDu/mW0yExBaOQpx4gzLA2mLp7LS
X-Gm-Gg: AYBFou1FcxXK2HOmzcJCAeQBWyA1xv/yncVKGDJ/8YJ3e+23VSo0eGRbnjaTCOANY5j
	OtauKjmYfl7PXN+YD1kMdd6y4Z2EfaG6LSKeYIPC7RWsAUx53/hQ5R708Bc4GFI5W44Hl8jSDgy
	Drs1BpoqUCiXokQBm8aApnZu1hEc6uXEcRu1hB5NwBcjG9LYVr71QBVJdHsfWHNvh6/hYuRZfcq
	5Kz9HVnMjU6geShZmfNMfqWYCfOZ579eznwfQufc1j0od6X9sdPqAbNjKU62ZNzKxT8ujwyQnlr
	x0NTUNMRGwKtdGSzNUnoIdHnK9OIhwx2M+odJ4GZljSMyBjBWh1+dpavVprYwb8Sw0EHrSrxlJF
	0dbVQEcb/D626Zi1cpslNE3KQLORpsV23GBMYmKaaS3BDbt0g0JpKo09cRcyLHHjFNimZt9sEmE
	mhlFMfKP+9oR9ONnD4w5tAJCUj/1tkPVCr8w2WhTsw31GxrHqEMLmllf4GDoKNef0meH/t6cuYh
	3syxUUpylr/AF3gGx1K+9Ms4mEvc8SpydTwVxZxKWzZzUM3CU7fBwFUISru5Y61otd1DYm0BvbN
	foQX3bSbeoux0/AOvKfY4orrmfrt9KieSj7MMXgvdpsGyrnUt+/H8Q==
X-Received: by 2002:a05:701b:450f:10b0:1b2:41af:c21c with SMTP id a92af1059eb24-1b503157396mr7939805c88.39.1794769129109;
        Sun, 15 Nov 2026 10:58:49 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5329ec87bsm82306c88.0.2026.11.15.10.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:58:48 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH wireless 0/2] wifi: brcmfmac: fwsignal: bound indices from firmware signals
Date: Mon, 16 Nov 2026 02:58:41 +0800
Message-Id: <20261115185843.64633-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches add bounds checks for indices that the device sends in the
BCDC firmware signals. Patch 1 covers the AMPDU reorder indices. Patch 2
covers the interface index of MACDESC_ADD. On USB, brcmfmac parses these
signals with the default module parameters.

Both bugs were found with a static analysis tool that we develop. A
userspace harness that compiles the fwsignal.c functions unchanged
reproduces them under sanitizers. No hardware was available for testing.

Maoyi Xie (2):
  wifi: brcmfmac: fwsignal: bound the AMPDU reorder indices
  wifi: brcmfmac: fwsignal: bound the MACDESC_ADD interface index

 .../broadcom/brcm80211/brcmfmac/core.h        |  2 ++
 .../broadcom/brcm80211/brcmfmac/fwsignal.c    | 26 ++++++++++++++++---
 2 files changed, 24 insertions(+), 4 deletions(-)

-- 
2.34.1

