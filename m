Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558DE4BC02F
	for <brcm80211@lists.linux.dev>; Wed, 22 Jul 2026 11:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784718444; cv=none; b=iRgG2BK/KsU1R15ouQNfyTJW1mZMHoAPQxJguym/IsUaYkxKJlyNHrjHGFEjPqhbyojQpxsiGEaeb5woDAPMyg6oXLrz+ck/yHFLEyGPgLsF98yyAgq343xDtVnOBeBNS4lvy6vmFeUqgA1/rww5xHfKIRK0SPmE6DaoUbvx1t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784718444; c=relaxed/simple;
	bh=Gvq8bn9U5dieapHENn6/tVPX84MtSWPT3qgQXTSmcc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PHc0rBKcNu3hwEE2azVi/obzIuAUxbJHFPVrLhaLlQuZpAqJqheSJkxca4mWNxSj8k35dx+HMHQhn3AXu5pIf0oGMRMQc1UIt3gz4Pe67IoR5VfQ8GbPgmVDVUFitPmTi3dpPGJ6sxxz/OXZvWV8Y7mlQQ5zYTmfhlH6GxtIdgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b=IHcPP6DD; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b="IHcPP6DD"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9e30214d8fso8827817a12.3
        for <brcm80211@lists.linux.dev>; Wed, 22 Jul 2026 04:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20251104.gappssmtp.com; s=20251104; t=1784718441; x=1785323241; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pn78C/RraBqASlFsZzfGipH4Pd/7ButyH44MMOGEmn8=;
        b=IHcPP6DDJ8Nl4qM0iEMF8dszgiGWQKK9teIMd8gLQxxya+DpXwOAu/Pto6/XNftNS1
         jw6OrGTfKmCzO5iZKL46OebVzTwqFGY/aY8ZqsxDgeY95GRMPcm6Vz82McYE8W0SEwvi
         lvlvW1RbGzH3H1ulLvg8XhLTkCZ+h2RC4G6FiOXRUDlwgJ8x6+y6/vAUj/KDz4oxWf8V
         U7/6JgnJg20c6nfEulikOyPt7/E/fLIDgLZeNx+FCbG7iQ2NeXXw5n8fywiEnM3FbfpZ
         VY+Am5nQf2BkqRlREbMWyqIthk55ck754mKef0K72Kz82V7wi6FEAI3lEIUycOi/hf1G
         jQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784718441; x=1785323241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pn78C/RraBqASlFsZzfGipH4Pd/7ButyH44MMOGEmn8=;
        b=P7nVT9283en3PToy/Nf4+DvHSXT+m3LRpLG9Gm60JZUZxRCo9/TFw+AvcebawLLJ1e
         7s97P6sO0eRx1onCftfvQfewklonR5PcyrO3AloSCinrWP9bf0gnlcbkxUh0aeaULhzN
         xTe/Op3jgtdma6kTGN/lbi8wIELdH1UOZld/jISTTUjC89SStPw33yspzSPVETMseT01
         DxlGqfqvbVmFwwm0bxxKLPsP51PwEHEYW879jTAgMJzXSRZG7xLI1aTE9QdsSIY65PbB
         vw2OyMmYkL2G0grin0IqBS6xRC5r0s7HD/AkWuR48liV6a0JiRHf0NK/o8RHRVux54GA
         k3mw==
X-Forwarded-Encrypted: i=1; AHgh+RoFuZFlx/YinzSed3MzS8BJqxxYOHTm5HDOtBGVRF85j03atZdhiTHVU1v2yK0HviWpILwh3qz+y6Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YweyxvVTOwVK6ULZvFFMnlGHDjvKXAR3YQy9ZCS9S4addVhW7MM
	DqBhD+KQta1Xg2CHlEViR86KVhBvT2lMwClJ0CqNiLMMw/alytItUNn1g9Ia5fGWvUM=
X-Gm-Gg: AR+sD12XBaxNnELzxirDai5OJl15kpf09X/BIkS9gWwq6iHF2Herohad6dOsoRgPQwt
	iXTrLHh4oXvUqQYGqZwNTCHAqErDd01Y2T7I/0kekJZoQLuvOEUrXBQRWbkFzYNBcIVoANBBOdi
	Gw2ayMeWnlPT84R/jWqLDihZ8+TuT+5RV0ms3egVi7BwzoWss1W4+akDhVrQVuVlvi2T3RVETko
	2ZZ9PPk1Dpgpvuhsd6S0yChjYZ/dSMAp4ymGjXi6CZI3DhME9l+ykc7D0bnEEujhZ2sFnsi2Q0G
	G4Y+kEZdb7JgvG9P1RKy9c9eb+RRB7pSZ/bpJL9RPQDbtf+Nd1WUauIsAoxuXXg9bEuhnF2qyok
	JoHeZ9wkkZK9sJOCBX696mplAAEkrxhkzeA+HV3poOdfEzPXbX9SVJx6hPfI//rmRxKVvi0//M4
	JshoSq1kgcXhUUkjUg1tyy1tA23DgRfvBuXhB5d33QRszzRuWN0M5d5vlg63WN0s9WnuEGsblrl
	+SuKbeT1uR+ZpSXTy1r5Ecq/XG0Hmw5
X-Received: by 2002:a05:6a21:b94:b0:3bc:5284:5445 with SMTP id adf61e73a8af0-3c3ad7d7fc8mr25322681637.21.1784718441385;
        Wed, 22 Jul 2026 04:07:21 -0700 (PDT)
Received: from Metius.iitm.ac.in ([103.158.43.43])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-3147e07000fsm15952879eec.21.2026.07.22.04.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:07:20 -0700 (PDT)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: arend.vanspriel@broadcom.com
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] wifi: brcmfmac: Fix memory leak in brcmf_sdio_read_control()
Date: Wed, 22 Jul 2026 16:37:12 +0530
Message-ID: <20260722110713.115988-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The memory allocated for buf is not freed in some of the error paths in
brcmf_sdio_read_control(). Fix that by adding vfree() calls.

Fixes: dd43a01c5cdb ("brcmfmac: use dynamically allocated control frame buffer")
Cc: stable@vger.kernel.org
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
Compile tested only. Issue found using static analysis.

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
index b725c64e5b5c..0900211ba2fe 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
@@ -1792,6 +1792,7 @@ brcmf_sdio_read_control(struct brcmf_sdio *bus, u8 *hdr, uint len, uint doff)
 		brcmf_err("%d-byte control read exceeds %d-byte buffer\n",
 			  rdlen, bus->sdiodev->bus_if->maxctl);
 		brcmf_sdio_rxfail(bus, false, false);
+		vfree(buf);
 		goto done;
 	}
 
@@ -1800,6 +1801,7 @@ brcmf_sdio_read_control(struct brcmf_sdio *bus, u8 *hdr, uint len, uint doff)
 			  len, len - doff, bus->sdiodev->bus_if->maxctl);
 		bus->sdcnt.rx_toolong++;
 		brcmf_sdio_rxfail(bus, false, false);
+		vfree(buf);
 		goto done;
 	}
 
@@ -1813,6 +1815,7 @@ brcmf_sdio_read_control(struct brcmf_sdio *bus, u8 *hdr, uint len, uint doff)
 			  rdlen, sdret);
 		bus->sdcnt.rxc_errors++;
 		brcmf_sdio_rxfail(bus, true, true);
+		vfree(buf);
 		goto done;
 	} else
 		memcpy(buf + BRCMF_FIRSTREAD, rbuf, rdlen);
-- 
2.43.0

