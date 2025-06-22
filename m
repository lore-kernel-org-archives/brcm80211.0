Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB3018B0F
	for <brcm80211@lists.linux.dev>; Sun, 22 Jun 2025 15:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750607338; cv=none; b=ZulkrTyn22qUzG0U1QttksMBd10UKglgqCKXwrYlZUwUSBhbwN/xX3hPYK/9bR1B+rvQG/fla/oITvjn0izSxQQDgDswLI18gU/hJS7RN/EF5YA/ME0QrjxD6lZkF0+wIa7ijF8wVu8bQaZq4KdQdpwCw9NcGw4gUP1RD2muUF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750607338; c=relaxed/simple;
	bh=nYAydejRF+851N0iDpYZ69u5XQok+wApYHZ8qDoPyck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OaNxpPlPfw6bj9crTa8abc27EKmsfYH/+PHMXE4PCDywkulccAl1/+mvoT4jT7zVHw5cDnGysrRs40IbdghcBjLfk0A4wOgqzmxa6ROY1gZilj0utNJzeAYdBkdPgUPe89FiUW4TYeh2FgIGrurQByR9E734vohgMjIvi0SKrAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=hGMa4qlB; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="hGMa4qlB"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-adb2bd27c7bso509367666b.2
        for <brcm80211@lists.linux.dev>; Sun, 22 Jun 2025 08:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1750607335; x=1751212135; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ykytJ19qhLnLNbAMsXtAq9tDXr6uJ5hDujPOGMEyyok=;
        b=hGMa4qlBsNKlhGQz67frTnK6jLTLsDa10rbsphWKmP85DHpvrjcFPrQCVLSYkyCg/H
         puuXzsUYgXtv5cJl5GUFdRQHcbHnDjQ+VD5/fTISu9lpeTt+sakecINkzdqinbNhcTdh
         M4MEFjNOrtQ/zF61Rtd1qcpHxSY9jbKeD/a2evTErtaxg1W94w2PrEjK7SYubG/h5Fqz
         Zxx5B0n3Szs4CX7h2DWhWBXfshdyHIsS4XoYWfBYg728TXI53N8N0ZHqYzPEk8EkGanM
         FvhdTHHmKD/c5T0q6ImjsyhMaW9H9gsGGLM+cVUey7hMitUsnwySvGCRSjjFW97XpZZ3
         b0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750607335; x=1751212135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ykytJ19qhLnLNbAMsXtAq9tDXr6uJ5hDujPOGMEyyok=;
        b=qmy7+sDYe96nc+Uq0LjHXk0bAmek+XrrusBRPTIsa59ubqSBJSJ85KOoXCuoz1M9qt
         RY2x1i9gFJWqhle1S18gO6t3ZfTtxKdOtesqY82aT0VioH2hTELjG0/OpnBCO49FYoIt
         71xh+AgLG9rt/cXG9A8Q/QAgGhgzB5e1szceKKKi1cM2D1Uidlrm++fu7AVkV0pjJmqB
         uYlAHhokfuoqadb5WfT8A/oR+Lwz8ml+OtTGB/GRCA0jAjM2IXMwd8MJRHrBq7NMcO/H
         Din7RFocZJW641+294Rx+KgqlsmBz7RKS2Y6eiWJ5BddawpFDAoqu+G/bHsquklr3Cmh
         i5uA==
X-Gm-Message-State: AOJu0YyRcC3yCaaxaQHYtsiOW2pcvjvNb8OwxYDm+hFBgn5Z0h4+76DR
	y+DI0ytqzK+Nveg/KT7IXxAOlwE4IVh/s0AN+XVN8lyxm/E2NpP8wz+R75DLFg==
X-Gm-Gg: ASbGncsjBLYw7PBa9Wxs8rWbHJMCndZX43di+AKpX0pUcXrmxm6e4tKRjTVGWNra5Ds
	PrNiEg4qnSVU3jUSDj1r4ht2qrlh6n4R7b80M7Hndda/pUe3JJcezChYcC8PtwPms4mPYKZ9AE5
	ioxLZ8055Eyjfc8WxnnmU75M7q3IhsA9m7J7RZmGQ2xL9qlj9kA3tzR06llSQdi0+bnrPNWTl4F
	WV43e+K6VNsuO9OF7fjwuMPDgtalApQzqfkUWI5y26uxG7fW3VFDnKu3S3HraAfDFvHDijQjc1t
	kA+7/g3OkSk0DRk1hpN0DtLfMZrNTdTmzZON1gew+NoaxybPbpE/Sa1M+e2YY4xv6QedEsQjhRN
	pvGIMfKv7tW9hM0C8x7ugplJ2953d6EIQ+IRCjSHfvheimehgUC6ZgpGDeadz1KKbRizxWpi9WZ
	QWkTSVfVnUFWoe
X-Google-Smtp-Source: AGHT+IHJ9GFpJ7wQiVduVXrIuQj9XRGcrJhLJVSE4rJlPRZny3FaOvEOkIjlhvd9Vu48g9iTkm8zXQ==
X-Received: by 2002:a17:906:c154:b0:ad8:a935:b8ff with SMTP id a640c23a62f3a-ae057ef75famr1019225866b.31.1750607334317;
        Sun, 22 Jun 2025 08:48:54 -0700 (PDT)
Received: from blackbox (dynamic-2a02-3100-b1e8-3900-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:b1e8:3900:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ae05408301fsm557509466b.96.2025.06.22.08.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 08:48:53 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-firmware@kernel.org
Cc: brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] brcm: Fix symlinks for Khadas VIM SDIO wifi config
Date: Sun, 22 Jun 2025 17:48:36 +0200
Message-ID: <20250622154836.2231776-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the duplicate "brcmfmac43455-sdio." part from the symlink target.

Fixes: c629575aa5ce ("brcm: Add symlinks for Khadas VIM SDIO wifi config to AW-CM256SM.txt")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
I tested it with the correct symlink locally was wondering why the
latest linux-firmware package (from the Arch Linux) repos did not
give me wifi functionality. It turns out I failed at copy & paste...


 WHENCE | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/WHENCE b/WHENCE
index b43d6ef7..3b69b759 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3117,7 +3117,7 @@ Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.AP6356S.txt
 Link: brcm/brcmfmac4356-sdio.vamrs,rock960.txt -> brcmfmac4356-sdio.AP6356S.txt
 File: brcm/brcmfmac43455-sdio.AW-CM256SM.txt
 Link: brcm/brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
-Link: brcm/brcmfmac43455-sdio.brcmfmac43455-sdio.khadas,vim.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcm/brcmfmac43455-sdio.khadas,vim.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
 Link: brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
 Link: brcm/brcmfmac43455-sdio.pine64,pinenote-v1.1.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
 Link: brcm/brcmfmac43455-sdio.pine64,pinenote-v1.2.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
-- 
2.50.0

