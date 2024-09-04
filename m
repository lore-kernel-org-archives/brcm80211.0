Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195B21DB537
	for <brcm80211@lists.linux.dev>; Wed,  4 Sep 2024 15:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725464968; cv=none; b=ruoEcmKRmwm12MQrWQOZgYHyOOkBDdKszacqCY06ZNTfXsi9mJn/yDg4B62dgovrsd5pFHcgK0jPHbxR2uaEOLeNtaacIIe6K0PtmWF6P1SASSAm5UzOQ8biUbK1VTL26Z8GFmIzqrLMRueD0h3Fit1ZIgsDKmIsksdIsktsiVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725464968; c=relaxed/simple;
	bh=gTJrWsflJRH8i+wGV7R/FlxM/03HQmUVxlPhNaScABY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GMX4bFcuO7OUaUHmbBzS04m949B95iblZjJ6cUMZSIwn6lwA5WDeI2I9zyvh+vn/zY+8c8D2EpxschoIcB2kpMEkZDCoQi76cb/8vAcjHCnSBuOij1kFiWXicc2b7L/CVeBeA1Ru9l27yQ5HKPP7kIVmJR6hAfnczg7kSXvv/48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0nTEoym; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0nTEoym"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a868b8bb0feso813789066b.0
        for <brcm80211@lists.linux.dev>; Wed, 04 Sep 2024 08:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725464965; x=1726069765; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ucfDxjSvRyxzVqonQmGsLlVw5jt/PwIM8Oy9nZdeRiA=;
        b=K0nTEoymxP0hmL90Md726RaN1ET7OJGechIugsSeI0cqqLs6KbxI9dCPQ1XXZpIMtX
         an6L9r1ke2KN4aRTrMo0OOI5/uIgiNpun5OSUpuMR1mvL2eBCyTvkWcen0JMpVDfpio9
         zhXA3kaXFXz9op5bhY3QfJPYlhrVqx2WBIAut+erDt94bMMzdI206f9bhi306cuU/y7n
         TT7bhUIe1b7WQbaY2udIcqqdTTkARvzGpNtFo7dVg1fJ2Sctn0YFVs87rXSUU8Tpouwb
         m+p+vleJqhjZZNxk9H4Qw5rrR77h8btE3kjQYUDPdUkYgBr41f2LxavFK5c8TNR/kIUX
         Rf9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725464965; x=1726069765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucfDxjSvRyxzVqonQmGsLlVw5jt/PwIM8Oy9nZdeRiA=;
        b=OhOtG6pvqFA/9MmmtyldvSlp5wzIwpRHlL9mSFKR/4x2aX2Ws7yn1/uRwbYTqyl3tU
         Q8jgHMQ97vwium/7JOkan2MdAtPlyql8MdnmkKjgDz99zzNYTj5nL1fYjp0qPeVpj1uq
         nvwkSdbV4PeFboC+cQ0gPSY0RhLwxXlwXrFV1hJcJ7YYFa0BFB3iNeoaBjZzLtNrrPku
         TI8Uv96m6U6NoVq1C/UmjN+ksnRWMvl1sgyY2LHl8UKSj2SWeR55eyYUjE/Q7/OfkAR7
         4Lw50JUqOvpoUZBX4eGFZtzGA120GPr3JD7CQ1qrj+JzDARnBjL4nZwqdjmWqmqGSPbo
         DxNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRyC33JssPbx14BQI3va5lciUi2wyjdM4j2mzaaM636//ba7M2YTlSfLuyhRpDf22y9FLUaA0yBDU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRKphdXtp87NFlnr1WQPDjO7FKLbbdiSeyF9w/hQFmsmJYOfka
	xJKsC6z5iLLMvqfrlnoQvXSYb0UZo2GQ3/fF5yIABw8xWxUWaWtR
X-Google-Smtp-Source: AGHT+IFhXK5+Hg6Npk5cn92j6pprBkKVnnrHx6kaben4LyrmhWYlBqama/o1UbJSgEJT7tVkXG+Etg==
X-Received: by 2002:a17:907:3e93:b0:a86:7a23:1284 with SMTP id a640c23a62f3a-a89a379cec4mr1300521966b.48.1725464965246;
        Wed, 04 Sep 2024 08:49:25 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:82:7577:2f85:317:e13:c18])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a62038c0asm7825566b.62.2024.09.04.08.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 08:49:24 -0700 (PDT)
From: Vasileios Amoiridis <vassilisamir@gmail.com>
To: arend.vanspriel@broadcom.com,
	kvalo@kernel.org
Cc: knaerzche@gmail.com,
	leitao@debian.org,
	linus.walleij@linaro.org,
	javierm@redhat.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Vasileios Amoiridis <vassilisamir@gmail.com>
Subject: [PATCH wireless-next v2 0/3] Use functionality of
Date: Wed,  4 Sep 2024 17:49:16 +0200
Message-Id: <20240904154919.118513-1-vassilisamir@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
	- Split the patches into subsystems
	- Use DEFINE_* helper to define the resource

---
v1: https://lore.kernel.org/netdev/20240902225534.130383-1-vassilisamir@gmail.com/

Vasileios Amoiridis (3):
  wifi: brcmfmac: of: Make use of irq_get_trigger_type()
  wifi: wlcore: sdio: Make use of irq_get_trigger_type()
  wifi: wlcore: sdio: Use helper to define resources

 .../net/wireless/broadcom/brcm80211/brcmfmac/of.c   |  2 +-
 drivers/net/wireless/ti/wlcore/sdio.c               | 13 ++++---------
 2 files changed, 5 insertions(+), 10 deletions(-)


base-commit: 97b766f989bcd06e5a7651b1080001d7327012f5
-- 
2.25.1

