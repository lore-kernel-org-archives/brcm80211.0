Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622200;
	b=lKNWzeT13PpoSqP+hgM5EQuTuXZul5FsY418Tmz78YKi5awtUSxe0Yt7sF7JlVQegIQ0
	 m/vKq1g48fu1PvRhZLAbqsdN+uVpL1p6LVLmmokMt1XOJfl0/qUMbSimlgLu3pMwifD8g
	 jb1dbXE+D7z33JxcMXLm+ru48Q3kQ3wNvwIiplCTZM6g0RoJqnfzMceGKUdDsoJnhA6N3
	 AsTcwTRtCs/ASxGk2XgjtectFsu301V3uECrWtVFH1UDa6yVn/GbGIsRL1gttNz30lC/G
	 /elio3g3JNOrmWgIim9wUuQ1bstTGmxL6VQcV/ogbcz36ORs9gZFikXsazlUoFg8Ssg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3iOIXEmflTG6buskQdm9P4t1/QlWTCynkV6kHZ1H/SU=;
	b=sQCQonvMrwSTiheHEEHsrdm7fDXKUy5JYJ30ZV8mW2Bz3nuXn1D+XVRoGg+8qHP6G9pC
	 Eq8nDd2gUczJfpNBe90hwvbnWgnSlKQecGfNmUH3G4ffF9bfGlpY2TWU3uTtaFJJNpwdG
	 ySFj6KaKbNDEcJ9wXc5CA/sVqftqqMp8dSFx/q22HfEKD6bYzFY5HckJF2TToDhOF1T8Y
	 NdW2Hnd8fz0RP/IdDFiil66o+DYGFZ6d7GZhqHAtvmwDd6IKucK9G+JX6BxERd+YtgTje
	 huvWVH7j1Nfyvrbp/PSBpwG+5KDnlgTGP57/wZo8JHEyvVtV7kYyd32lPnKv0Vl8p3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YcsUaW2s;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAD260A5BE5
	for <brcm80211@lists.linux.dev>; Mon,  2 Nov 2026 12:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BAD260A5BE5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YcsUaW2s
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so18348145e9.2
        for <brcm80211@lists.linux.dev>; Mon, 02 Nov 2026 04:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793622199; x=1794226999; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3iOIXEmflTG6buskQdm9P4t1/QlWTCynkV6kHZ1H/SU=;
        b=YcsUaW2sDYY6ACD6dQ4Ai3UGmJ1NRv7RyDrG0YfJpmyKB5a01dyYk2n4YFHGLOPrXT
         9And60qzq0VAYltH8ufxJJmMHNJ6W++0MYQ1Qz6bF9L5lfaIgrAyejl4oTClwE3QEgC4
         8WMrxPReiSWYoxG4NJqu7V6ZSjL2nyV7qbm6m1AopWOKpOXwLrzroho/PkgKalVVCqS4
         rNYRbSdUjnnFpF5th39AKgxsUiDSiWCMpWHKdkXotIXoPfM6hFSLDWG2f1MuW2sXb1sG
         hyJUMP2BlsbTznmdCsDqHWyb8N2s8X7kFIA7ArHvXnEjR6T0hnBEa680VNb8qMCDv1uB
         FBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622199; x=1794226999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3iOIXEmflTG6buskQdm9P4t1/QlWTCynkV6kHZ1H/SU=;
        b=GkT/tk3QrGrBlZE5hCATu1bGWTwMTlIb8mG0YSHYZQMfUtSEPvwcMT7Ba5qiJpxpxN
         usXFKVRBdsF/+/K2TJQI7ZxHG+7oHcUsX6ysgw1SGPrknnhoRccphB/5mY1E1zmyDndO
         43JzPv3/oWKgjF7C57M47VNSP2F+733WbJ7deq7azF+UZDiDEfMgiFYXFoBZKApCX9HA
         GZkpTzF66QsNTeL6XKyU8obKZx2aWdVT59fQJM4EBdbfRUWZrCGFsAFnN7JOLzgIbaOE
         CWtWrvEHJec1gbDimEEe3+x3uMioVkF1sVwAatmOoULoct19QObVw4DQYh6I3GWQpZG2
         +VnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwx/sFZxvgAPPkDFcs1c8qz5HVzJQeODI6zLKrIT+YTd3wDljYCTQd8FYK1l5lfpKtmQHNpNir2sb4=@lists.linux.dev
X-Gm-Message-State: AFq9FYKqtvWVjsAAWlDIkDqFN4XhUFBo7N1rLoAi5a7Cl5I+A3sUDPVv
	roULEeQuTip9qD786/dGgbBIQnfM1RtkGfEKv4TA2sbQ+ZLONo04TEs=
X-Gm-Gg: AYBFou1MYJLb4L6ZlA53kHxAzPHzrcAiYSEIhzHEjCz/c9QV1LquQYs0B0x7LBbUSCe
	H1D9oD+3tQT7UHDFbw3BfNBtHdqTHMyfreZ4lzvJvO3c3aZtUVIge2ywzdDjvjPwkYriGnCa7wx
	XdkhabUgLCEAFItzuxZ2KjOkTttxJKpHboSZiJ1KmzHi4eE28nhrc6zkcZRNT+ae7FzewHZjN1u
	uGnKC781kJ78y1CD1i9AFMCjY1QWw85xemQ++hGSza6eNxDqKrw2ZGXOrud8SiBlbZIj6CgVzkQ
	FEnHU3A4y/i4eTZXMv70wbDINZmQQS7u2j/4dF7mNv6ccXjyBqV+lH/WQRTfav6bj9cwMo5iTDM
	RMplUQeRbbElcxmk69rsBVMmI3dBFATbWM+zgO9wB6lZ7/XMP7YItO1wGrtBckqlZ0E1hCJ4Jba
	5zXUPcSyy9od2alsp9mVGKP2YDwdsmLTk77UudcdoajIYkmNGLGLejDx+yDTr96UgDnGobGxkMh
	lhEMmr/lBMIpgLKngW6oKZmnHUdHoTGp6lYHGU8rGhbJKxOfeQOmsMSbaJg9/aYAWmS/QPaIw==
X-Received: by 2002:a05:600c:198c:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4ac15584c05mr237157175e9.2.1793622198548;
        Mon, 02 Nov 2026 04:23:18 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf67aa704sm255490595e9.8.2026.11.02.04.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:23:13 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: arend.vanspriel@broadcom.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	fariyaf@gmail.com,
	linville@tuxdriver.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH wireless 0/2] wifi: zero-pad SDIO writes to avoid leaking heap data
Date: Mon,  2 Nov 2026 12:23:09 +0000
Message-ID: <20261102122311.181075-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Tristan Madani <tristan@talencesecurity.com>

Several wireless drivers round up the length passed to
sdio_memcpy_toio() / sdio_writesb() for alignment purposes but do not
clear the padding bytes.  The SDIO controller then reads past the
original buffer into adjacent heap memory, sending stale kernel data to
the wireless device.

Fix brcmfmac (4-byte alignment) and rsi (block alignment) by
zero-filling the gap before the write.

A third patch for rtw88 hits the same class of bug but needs a rebase
and will follow separately.

Tristan Madani (2):
  wifi: brcmfmac: zero-pad SDIO write to 4-byte boundary
  wifi: rsi: zero-pad SDIO TX to block boundary

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c | 3 +++
 drivers/net/wireless/rsi/rsi_91x_sdio.c                   | 3 +++
 2 files changed, 6 insertions(+)

-- 
2.47.3
