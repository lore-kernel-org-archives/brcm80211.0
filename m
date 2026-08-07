Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC6B473C88
	for <brcm80211@lists.linux.dev>; Fri,  7 Aug 2026 16:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786120672; cv=none; b=czMd3ZOdHJ5CrXa0i7sTfvp8II3g2d07/5hZaKCd0JgJ21+Xcz1zFoZW3HRyJWJ5i7TpwbKGZkUcdN6CiHVoKNZLgSH9sZzzjj7P6wMWGvGYlb9Z2XqAy+fJIITsJ27KGaqXsqcQU7p9ji938SXV3bNpv9xbrLNO2lCgeBGkRRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786120672; c=relaxed/simple;
	bh=W2vPaAvbBFaEnI5PS+wWp9fGPFM0lRF90ZCyeiQzTGA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N4uYo8YAe0jQRJlQk40MiY9WE/fFpx1M4PR7KxOCTjPM0TkuWBQE7T+kNNO8gb/zxJa54iI5iUcSN280P7Rio2BpKxSa5DVVg/VzgkHKjSsHhTOe3rIProgj6s4fk2kkBp92y8xVSOYMoRF97Hkc0Q229slA1GHKvjk4p706oY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgeqL0FA; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgeqL0FA"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4a475bd9ff7so482289b6e.3
        for <brcm80211@lists.linux.dev>; Fri, 07 Aug 2026 09:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786120668; x=1786725468; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RYnU/CjNnSldiurArBMef+rqNUycTmCsidAIhbgMp9k=;
        b=bgeqL0FA9N8MqLUx0HNpSWX+B5e5oh5zoft/j3/JpOCrYAJKCxPS/H1gDvDfuJmda7
         HO9oHJYOptpuAXvN+9TaeaA8rZIfinQrKOj1jc6J6pBb//6pZpBEDkRuUCvMS5vwdHNc
         EiqNq06EKrZ5TSB8mrXkKIl+0PMC2Jo2wmbvWnyHLDVpGeC8xfu/8cXh3MtZpsbQPjy0
         j0kf5BCzmafmYYU8ABtQXPdGdQvAKpyl9bTaaNRxSwqpmnSm3ELtnsFyhiqmPL1LimyZ
         h0+34t2dPfdPBA6/tDqBmb1c4zE2ggh8EexdgMVZ3l9CbTKW+2AtHaLV1DIWSvctq9Yj
         /v/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786120668; x=1786725468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RYnU/CjNnSldiurArBMef+rqNUycTmCsidAIhbgMp9k=;
        b=iY/psWN76c2gImEAvZlxZOrHLI36Bqgs57HFF2dow2YZNa235DqH7EZ6gtA8dvymeA
         fhxfFXktSbbnRXhHYWo4OauNCclRB8yRv0cTs+hK8SM90yAHtvuv6WBAiiVYRx1dy+Fg
         6+iGGMVsDs3ILjkI9stNv1oE5n4ZwBvxia+uAP8ghdGl4YKByVdWwtnx1bq11HCMARHq
         gWvM7FVQxrYjqX9j/QunARStDHJsxfekez5W5hTW5zgeJjGEcYMwebbr+5cUne3sOmo/
         zsCdsZptILzO0xuLNwX05e8hfbu/ZP66ixgyPvYBruYkMaTl/mmAFAKh4HzxIruc+uDu
         dFtA==
X-Forwarded-Encrypted: i=1; AHgh+RqGeT6ujZIRP5yQ2Wz8sTTezxP8n+mQh9nMU6Eehpj+ljNpOiUruIfyewGm7u+n7IxFz8QCqn61p7k=@lists.linux.dev
X-Gm-Message-State: AOJu0YwoYQ8YFnvHFQRjuG+jLc8C98XJU7oKiaptBCYIXygQIYCnvQwR
	NJO/j3Z8OpN4Q2ZdvDXHdY/E3h1zCxCqoSsrj7+AGV5uz4AIkX9c/0KP
X-Gm-Gg: AR+sD13d6gNnDa7BGf/PugDI6CTeZciqoPgu7A2WtmQsaodHNq6Vb6gWLxqtJ8O5uh2
	R6n9I7934A4XiknDF8Ufs8QAD8TN+1A4R4adgPFRvcJEdUBEdCcG9tcWt0os5BrvNHy2+Ja1gQV
	LqaFBqQQm4CeTgozdu7UrVq85DfI+JQZzI4rfGVy2HkfNwYJrGJHooyDAgT46R5pcmUEB3yANGh
	zI7qQ2NI7fyIlRq1TtmWU2SL2lV7CbCNf53J2G9vPtU+cf45X7jS8FWid9xsPq63YWd1Sl6tFWH
	DrKPSiYpHgZZS4nkbe/QWwuh7R3sCMHrCXM7iUecqZGtIqwW/tlvvpm+tYCSz48zo1E3m8BEpeI
	ifdFzTZLxS82EVNhEzRlavqC+SUVYx8YPCZUotH5oooXjaOk4e7IrwLL5m+M/WoXX3V/hMA50xP
	ErqN4FKUw8ShWXdlYTziuvvUwq569wzEBlZiBzAJk18diGev17D2YIah/xnjDL0w1RRtP9dQAfE
	RH/uSJw4KNhu3UYtam7WHSJu7ft2ASuYrL1Qmdb6uH1jFReWsX1SBbAu3vWhwo=
X-Received: by 2002:a05:6808:13c2:b0:495:d9fc:238a with SMTP id 5614622812f47-4afae30e48cmr8312577b6e.3.1786120667910;
        Fri, 07 Aug 2026 09:37:47 -0700 (PDT)
Received: from antares ([149.88.25.215])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae769393sm7731773b6e.16.2026.08.07.09.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:37:47 -0700 (PDT)
From: Bogdan Nicolae <bogdan.nicolae@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v6] wifi: brcmfmac: cyw: pass PMKID to firmware if present
Date: Fri,  7 Aug 2026 11:34:18 -0500
Message-ID: <20260807163418.487508-1-bogdan.nicolae@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Zero out auth_status on initialization. Otherwise, garbage will
leak from the stack to the firmware (when ssid is less than 32 bytes
and/or when params->pmkid is set). Then, pass the params->pmkid to the
firmware (without it, the firmware caches a garbage PMKID on successful
authentication and denies a subsequent association request that includes
the PMKID).

Fixes: 66f909308a7c ("wifi: brcmfmac: cyw: support external SAE authentication in station mode")
Signed-off-by: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
v6: Fixed diff line number
v5: Fixed line length > 80 chars
v4: Fixed indentation
v3: Added Fixes, Cc: stable, and Acked-by tags
v2: Split into a separate patch

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
index 873754be5..2c59b5e57 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
@@ -200,7 +200,7 @@ brcmf_cyw_external_auth(struct wiphy *wiphy, struct net_device *dev,
 {
 	struct brcmf_if *ifp;
 	struct brcmf_pub *drvr;
-	struct brcmf_auth_req_status_le auth_status;
+	struct brcmf_auth_req_status_le auth_status = {};
 	int ret = 0;
 
 	brcmf_dbg(TRACE, "Enter\n");
@@ -208,6 +208,9 @@ brcmf_cyw_external_auth(struct wiphy *wiphy, struct net_device *dev,
 	ifp = netdev_priv(dev);
 	drvr = ifp->drvr;
 	if (params->status == WLAN_STATUS_SUCCESS) {
+		if (params->pmkid)
+			memcpy(auth_status.pmkid, params->pmkid,
+			       WLAN_PMKID_LEN);
 		auth_status.flags = cpu_to_le16(BRCMF_EXTAUTH_SUCCESS);
 	} else {
 		bphy_err(drvr, "External authentication failed: status=%d\n",
--
2.55.0
