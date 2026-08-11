Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2F030C37A
	for <brcm80211@lists.linux.dev>; Tue, 11 Aug 2026 08:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786436835; cv=none; b=n9aM9p4Z+s1jV69U06v6oNcDU4a4wmm/zDSHFu8d96waJiRYlZocLUvUYeDukl8lZf0jy5eFr1br0qDg6T2RuukLjRe49oOpPKRumw2qEC3bUK4BpMjrUeXsAKQ/DjWFApSoP1FPwdYY4vSxl5GTeKAJYgPhgCl0YChoaJ4wxpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786436835; c=relaxed/simple;
	bh=ok4xpuQbwDIqZ3qpbUpj7vT70ITusOHkGyK7XwCc8+w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SFe1buBZmwuhOFwlVjTTi6w2Uq5w9EjLgr0AK1ziWcXljaSiIhxAjbb1gcoob6Awnje4NE0Ll1K5Q5zhzzPuzUPsVVSwRiVAUQWkDLwLS8wgNACPlv6RXaWEymG1WQuqh4Gy1HMYg67Rk3sGHIjnRJW1Lw2NRqKdTORHVhO+d2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9hDU6XL; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9hDU6XL"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4956242332dso27047155e9.2
        for <brcm80211@lists.linux.dev>; Tue, 11 Aug 2026 01:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786436832; x=1787041632; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3WNN0jBnqjNkMd8rlfEtTd2nbjLXRpa7uvLdlshlheE=;
        b=V9hDU6XLc1LHBmWH3OxuToYYoiSeOKw1XxI1q6Y3ZEiZbQtp9xv08B7uMgS4Tz6IJQ
         Yl94s6Qx3gD3wqPDinrTXYPGqi1hH9J5yuW28EDf5sq7x9C5wI7EYiRicthnzIT66ynx
         C7VcK6u6gOeqUewxAyuf4xctunATikh9XpqhX7HQVxTP6SyzcnH3GIyFOlruCsc9r7xV
         hBFHaWAuvy14CBn51oT9hiuGqYIOjtGf80REiT/wBx9gCFKlWjFx8I4qJL6D1+gKmc+k
         7afGHiY/mHC1uIJbKrJ3b6j/eGj+gPANa+NuvUz/uRaEJCEUwYVJ0GQoXjq7W0zALTiG
         PTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786436832; x=1787041632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3WNN0jBnqjNkMd8rlfEtTd2nbjLXRpa7uvLdlshlheE=;
        b=c7lPu3yYAW5wwMuqv3Dq73FFd/MT+bP/asq2Tocw9R3fwAayor3NVDgVP2XdwHURwZ
         lm3SdbA4ba/voBBwckTm/BqgJP8/umDn4JTK2UGfxtvlk+lJ5uc3qXtghki4vwjEFISk
         BhC/1qYYv/3yQwGkCZKukWwk/K4K2udb/LeY+Lksdm1k8JVwLMPoRKj0cqynY+iC6RH/
         wFX+LWKZNeBIGzWaD9riWLUWd02815mcTl+SvDCdgx5Gzie//cJyXxS3yNbqwqsqh//R
         NJng9QqRANpmoP/srbGeRVsX63BBKLCQZmh1eODGCcVKixWglFR6HQZWKVeFsI188KDG
         +/Dw==
X-Forwarded-Encrypted: i=1; AHgh+RogSrYsMfSYdcwEdg/DCOVCnqqSAEZbl1Pm5u4rsXMk8gVQ2+eccdGz07m4utSP/86uJs06VduN1Tc=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywx7vTGf4EHFgGH1x2oCMLZo+avpAWcAogoL0UXFPzhADgkoADb
	q5u8SpDHfDxNiuTGSnQNMM6q/aLd0PtQ5g6AfStdCpmwrvTsh8wHTGh8
X-Gm-Gg: AR+sD12TQUvyEbUPbulEvj742HxidIACp+q1m3Yrt0rHoOLr+Vj/UK9cIOtRd/rEeSz
	2+uNgFTiwNqCT9ImTDx4ioRrsLisddLo17msWoRPzAQrq1BWqljRRGUJC4pOiE6m2Eb/EuOXA7k
	teqCNGh2rrFqNStB2su4aTKBwigTi+kg+MXOdHMCRmXT8c7RAqBvRfm+SSOT+yRe6vYVh049r1B
	62rOQzRk2xo6lLf7iZ24ddr5ZPAknWBss3vT4/bRHXj3b0P9JxFDr2niI6rjJpUgGWRm+p1EqkO
	bieDexOkHEgKhJ5LyTjV1kbKBIuTgrC2VA5iunqWhrhj2XtEA4MgPOwtKpOsvFZuC4iEPOlmZBI
	wazYToM8LcL7qWXhe5mxYnT9yagZIXTXoE6I8jqjgXaJKd8IUrmwkiJ1wqweb63+LpuZvxYR78N
	ZuA96N3DBg+ax28h/cwkVGTUBB3i3qNePC4TJK2UWLFFPB7RhFSwEsqCObJvm+vsxAUb2Ogz+TJ
	/c+FBPvO88kHsv1P5RIGybY6uEEJU5yekM5FAGJ/JD0yvT/caiygfIgFIWrP1cRFV13wcZUSyzF
	N/lwLpwwRAGCkW2y839nfrPhqKXANRUdtN6fGpXP9DoFbYW64YxJ6UvV1H3MBKNZKK8A
X-Received: by 2002:a05:600c:4f49:b0:499:726c:d658 with SMTP id 5b1f17b1804b1-4997913bf43mr15555825e9.19.1786436831868;
        Tue, 11 Aug 2026 01:27:11 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a133-e401-bc8e-d36c-2d08-c5e0.310.pool.telefonica.de. [2a02:3100:a133:e401:bc8e:d36c:2d08:c5e0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977e89d68sm21853155e9.3.2026.08.11.01.27.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 11 Aug 2026 01:27:11 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Hante Meuleman <meuleman@broadcom.com>,
	"John W. Linville" <linville@tuxdriver.com>,
	Franky Lin <frankyl@broadcom.com>,
	Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: brcmfmac: fix lost 802.1x TX completion wakeup
Date: Tue, 11 Aug 2026 10:27:02 +0200
Message-Id: <20260811082702.44521-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

brcmf_txfinalize() decrements pend_8021x_cnt before a lockless
waitqueue_active() check. atomic_dec() does not order the decrement
against the check.

The waiter can therefore observe a nonzero count while the waker observes
an empty queue, losing the final wakeup and delaying key installation
until the 950 ms timeout.

Add smp_mb__after_atomic() to order the decrement before the queue
check. wait_event_timeout() provides the matching barrier. LKMM confirms
that this forbids the lost-wakeup outcome.

Fixes: 21fff75d2fb6 ("brcmfmac: use wait_event_timeout for 8021x pending count")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
LKMM results with herdtools7 7.58:

  C brcmf-wakeup-buggy
  { atomic_t cnt = ATOMIC_INIT(1); }
  P0(atomic_t *cnt, int *wq)
  {
  	int r0;
  	atomic_dec(cnt);
  	r0 = READ_ONCE(*wq);
  }
  P1(atomic_t *cnt, int *wq)
  {
  	int r1;
  	WRITE_ONCE(*wq, 1);
  	smp_mb();
  	r1 = atomic_read(cnt);
  }
  exists (0:r0=0 /\ 1:r1=1)

The fixed variant adds smp_mb__after_atomic() immediately after
atomic_dec().

  Observation brcmf-wakeup-buggy Sometimes 1 3
  Observation brcmf-wakeup-fixed Never 0 3

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
index dad6f4563d146..b192947ab4735 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
@@ -555,6 +555,8 @@ void brcmf_txfinalize(struct brcmf_if *ifp, struct sk_buff *txp, bool success)

 	if (type == ETH_P_PAE) {
 		atomic_dec(&ifp->pend_8021x_cnt);
+		/* Order the decrement before waitqueue_active() */
+		smp_mb__after_atomic();
 		if (waitqueue_active(&ifp->pend_8021x_wait))
 			wake_up(&ifp->pend_8021x_wait);
 	}
--
2.53.0
