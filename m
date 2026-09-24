Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BC13BB48
	for <brcm80211@lists.linux.dev>; Thu, 24 Sep 2026 12:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790253053; cv=none; b=KT23WQ7Qt476/As4R4vU2Bt3zYpwOcap0HAPK5LbeciRtqEdu1vVoJ3wmkkSyWafFnV1NyZ2jsBRuxF8CivWfGJ61mHfLbLdZz9prACaXVv+H1UKInn7+/xYYa0DHYXQ/5CqlBn7nfZFDNpaxFahKfu1CjEzMtp9aiPw58Xk/n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790253053; c=relaxed/simple;
	bh=feq1bcLZOkeXI/qUwCevPwJr4SdTs/1WRLQXKorQ6GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C+nLIM+vSD2NA9LKnlM3+MJBaRFZLTQqkSVCtbzLqVJTtoSHNafQgyXvOlZEXnAt4715CulhnAR8WUyB6e0WqhRVF4k5AUDvWWhmA/u9mU58BNzMVMRUfw0oBrtdxIpeGzt4AALrFvhn3Ut4F6+17qj8sTFS3uNZ8zJtKwlok38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AriEz0y5; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AriEz0y5"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so13862435e9.1
        for <brcm80211@lists.linux.dev>; Thu, 24 Sep 2026 05:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790253048; x=1790857848; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0D3eaT5BNEoIaAjsEGOHSHHnJMJpvKkiEM0V7CbB5XI=;
        b=AriEz0y5k8lGQvBjWM9Q3ehdQDYvDs9UJwtaljM95qfU2hcLqMbfKTqllI0o2FXvkU
         Aj9LATgP5PtQsjwUehIAwqUehPZbpkISlSpvrXF0teJ+VXXf5a+wyNzgWo1htjJBpUDG
         P84Kxc4lJ5WT62Yh/2hx8h54+kV5H/VKnwWBrXG+I6hUyx7LNXJicWJ2zZne7BxjhVqi
         jOOs46cjwmEjRl75ROrm80ZaFwO5VRTlv9KXKjjy5fp4/HwMaSJp/eIDTPpeK3wPBHwf
         Zil5g42z23hz5SB95aJ5wSA9zU2aFmaMsLzt9F0SQxokhww/bKSk0/U3skH5RjMnGos0
         U5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790253048; x=1790857848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0D3eaT5BNEoIaAjsEGOHSHHnJMJpvKkiEM0V7CbB5XI=;
        b=Tq0ApWBuS5GX5HMG8fcXPiTph4MLKHxBZOIHFtBYqJHGnRz5aiMMJjZgvBmYJq8TPH
         vVn9kv5bhetnGmGbbMInm5JUO9CaqfQ3Wm+32+P5NimtGyoJnPubwtwb4n5asgMx4Otf
         gQZJFt3J5K4Nv+Xzzc4lqLDNN6t73n3FF1dif2MGwTRwp6G8EYOSgMHTsgsgGU/mXWDZ
         O5MXz3Lp4LWW7YLr5WNVAr5YlhIslhKnQCOnjHJazcPPuXe4R+TPKXPo+9Tp5qZQnwEI
         fQzQj/9KHk6orZ8zU0l7cl9ZA+g3zvSuFbsPkOp0aAUvl2+3OteKxQ8vAuL8kzW1Giu4
         Fx2A==
X-Forwarded-Encrypted: i=1; AKwUvBwHU9Xb6jnckOJLWY/jCDO/DXFq2SYxA386Uh7hcAg+HryrEQmEkQvVkMtY4qU6CiYar9pJpPa5A+A=@lists.linux.dev
X-Gm-Message-State: AFuF++lLgYhTBiRyLmwyfqEi3p3GOWJxfP9/gimoMMGBeKSIFP9PiO8R
	eGf0UnJ1GvutkS0h1ac1bfekr8PktHGPBHmGH/7vtI1KlvapKZKgM711
X-Gm-Gg: AYBFou2l11zT5QfJJ3Rpdw3fJ4tHgoUIemOZsRhkh03Fxj2khK+VWtmVBiCFseOj1C9
	pN6cC8OjG/Z3vx6fVgnqZ4sISxFBrPrRGt15piR9mbVmNvR916RrICbG73aFV1UOwB7ByoD7OuI
	SMgL1kNEthDOGGZvWZRh/LvO+64qGCiKcAr16D3F9CSgXnmLy2wi7gW2BODxFGE7+2Flwvpxkm7
	bUpNHS0ZouNaAejazs1NkGNNgFZMBpVpWYMbmdLnJnJa4sIiREON5UitXHelo5yUpG1e8JDLQbD
	Ck94N3fwQS+GEI2zHLdoZ/ztpjTgmYZU0kTsrVykW0tJOXJdP2kEGvQeI5pG5Ukz+9jckUIbWG/
	Nvwj5gHbe6hD39GaAEhS3XxaOD0rLG8iSFbQDy6cHggOqTy0oW+kg2Tuhn8enZTkMwhDXtEzN6p
	Gc95HBLimR/TTgQEElc1xkdn2DjWBQvEkSPDYEGTmnmlBfmMuVgb1VIJD40734+Z8dv4tey/tnQ
	gNxob3JSJiCBhH1vobFiJ3nXp+eKOV3Sj2eTvPkfVIEp6Y3VPFdKfZDJ69RMB2KKgjwY6bclk8=
X-Received: by 2002:a05:600c:3b07:b0:49e:84bf:6121 with SMTP id 5b1f17b1804b1-49fe66d1653mr39911805e9.13.1790253048131;
        Thu, 24 Sep 2026 05:30:48 -0700 (PDT)
Received: from pws-dionisio-3680.powersoft.it (78-209-174-168.subs.proxad.net. [78.209.174.168])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5bae43dsm64010115e9.5.2026.09.24.05.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:30:47 -0700 (PDT)
From: Michele Dionisio <michele.dionisio@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Michele Dionisio <michele.dionisio@gmail.com>,
	Hante Meuleman <meuleman@broadcom.com>,
	Fan Wu <fanwu01@zju.edu.cn>,
	Kalle Valo <kvalo@kernel.org>,
	Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless 0/1] wifi: brcmfmac: fix oops on removal while wpa_supplicant exits
Date: Thu, 24 Sep 2026 14:30:26 +0200
Message-ID: <20260924123027.4122909-1-michele.dionisio@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unloading brcmfmac while wpa_supplicant is still exiting crashes the
kernel in _cfg80211_unregister_wdev(). The P2P device interface is
removed twice: once by NL80211_CMD_DEL_INTERFACE (brcmf_p2p_del_vif())
and once by brcmf_detach(), which reads ifp->vif before blocking on
rtnl_lock() and then uses it after the other path has freed it.

I hit this on an i.MX 8M Plus board with a CYW55513 (Sona IF513) on
SDIO, running the Ezurio backport of brcmfmac from v6.18.22 on a 5.4-rt
kernel. The code involved is unchanged in mainline. It reproduces with:

  kill $(pidof wpa_supplicant); rmmod brcmfmac_cyw brcmfmac

The patch takes RTNL and the wiphy mutex in brcmf_detach() before
removing the interface that has no netdev, and re-reads iflist under
them.

Testing: on mainline the patch is build tested only (W=1, no warnings).
I tested the same change on the board above, applied to the Ezurio
backport of brcmfmac (from v6.18.22) running on the 5.4-rt kernel: with
the patch the reproducer no longer crashes the kernel. I am not able to
test a mainline kernel on that board.

The analysis of the oops and the patch were done with the help of an
AI assistant (Claude), from the oops, the driver debug log (debug=0x406)
and the driver sources. I reviewed the change and I can answer
questions about it.

Michele Dionisio (1):
  wifi: brcmfmac: fix P2P device removal race in brcmf_detach()

 .../broadcom/brcm80211/brcmfmac/core.c        | 27 +++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.53.0

