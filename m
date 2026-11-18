Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.71.186
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795036272;
	b=KOm6axlhRiPFI8PLsfL1cfyr378IFoeZUlPB5jtfyaAhvyoBKFsnOd6yGj31/rWWuKYl
	 DsM+xvJd2qxX4+JEikgZ7nUrgvwYZSJ/nFRS/RtzNVfBPczyMfd9/+DHbDQ0fY8oKhtJk
	 XOTuBAEr5hBfiHJfXe4f9ISuwOF9clUzd5X5vFvG9/VWvjBXAU2lK/E8qMLgv33QXYROY
	 s+lwSzjnNnglsmK6cWWEbBK+QfEcx5dmnOSheO010AHdt9HUKMjgQ8MTcO/yqMGFkIZ05
	 Yq5dgOgDZjwQYAzhUNgn0CbF4kH6jMOHw7xWxz9CAWamZEEX7NzE6lToHO9QpnRAvGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036272;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Report-Abuse:Feedback-ID:
	 X-smtpcorp-track;
	bh=H/WlOzQPaGUcxDofm4SkODFhhO/r7lebnQiNEO6E2YY=;
	b=qpE/xwR2bxoNmBOor/0zN9D2GO5/TGni7M7mhHP6N7Hm/CKZWPH4VFjHJfjUCveRz+mm
	 t+jM5JmC2PcMMMBOJ8uD5xtJTEIMyuzFk5fvNxffkjqp3OMmhFtzOPxfAcFObuOCjaBNU
	 +gOm0iWAY72rJdh92H8JVLUy2nvA0rGfoxcPKkgFbioGeWuCWVPFENH995wTF0it4jrOa
	 Xk4BcxvrhOu1totjvGxhIDIR6m62vHMEKrFWFVlUqjf9gjuWc3ZKwO5qm6cx0ouFzeySO
	 WbQz0FJCKp4eb46UhtCtbp8dIh3Mkb8Frf/g9Ctkm9lH9AMW1XKwMHjC73jDswfCFOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inlimbo.org;
	spf=pass smtp.mailfrom=em572954.inlimbo.org;
	dkim=pass header.d=inlimbo.org header.i=@inlimbo.org header.a=rsa-sha256 header.s=s572954 header.b=NXFJ1+rx;
	arc=none smtp.remote-ip=170.10.71.186
Received: from a5i186.smtp2go.com (a5i186.smtp2go.com [170.10.71.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF78606A31C
	for <brcm80211@lists.linux.dev>; Wed, 18 Nov 2026 21:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AF78606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inlimbo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em572954.inlimbo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=inlimbo.org header.i=@inlimbo.org header.a=rsa-sha256 header.s=s572954 header.b=NXFJ1+rx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inlimbo.org;
 i=@inlimbo.org; q=dns/txt; s=s572954; t=1795036264; h=from : subject :
 to : message-id : date : list-unsubscribe : list-unsubscribe-post;
 bh=H/WlOzQPaGUcxDofm4SkODFhhO/r7lebnQiNEO6E2YY=;
 b=NXFJ1+rx0dPR64GqyWKkZTHvGrFciH99CIH7fmEzw2OIrPNx0lYrq3FXkSgPlUm/PJafm
 ql3dJhQ+iI8Wg4oUFiNkH9rROOQC5hToOGBc3mET5zHiC0Sux1b+vQgdDNlj9wFmjb4XdGS
 y4LVQlNdvNbwd8meaGg0wCYQ84ecwOa2oJPrKcAyVGth6mYn+kavowssZjxSNs0hXopce4y
 04v6SZuDnqJVMoJOT/1AgfK0ItJR1kRkzKdQ6KL2VpkJpjbaJcw/9y/GXDl+z9x/v+5Kd6Q
 eMAXVeniCbotKm7CxkTdrRFuN2BW8DZjrKjJFeLol10KynZ5JfzhzvOgjRBg==
Received: from [10.4.240.50] (helo=franky.home.inlimbo.org)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
	(Exim 4.100.1)
	(envelope-from <blaz@inlimbo.org>)
	id 1xTmvl-AIkwcC8skKF-rKVI;
	Wed, 18 Nov 2026 21:11:01 +0000
Received: by franky.home.inlimbo.org (Postfix, from userid 1000)
	id F14AE460072; Wed, 18 Nov 2026 13:10:59 -0800 (PST)
From: =?UTF-8?q?Bla=C5=BE=20Zupan?= <blaz@inlimbo.org>
To: dev@deq.rocks
Cc: Yossef.Osman@proton.me,
	aditya.garg@linux.dev,
	arend.vanspriel@broadcom.com,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	=?UTF-8?q?Bla=C5=BE=20Zupan?= <blaz@inlimbo.org>
Subject: Re: [PATCH wireless v2] wifi: brcmfmac: keep ARP and ND offload off on Apple BCM4355 and BCM4364
Date: Wed, 18 Nov 2026 13:10:37 -0800
Message-ID: <20261118211037.11870-1-blaz@inlimbo.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118123933.74517-1-dev@deq.rocks>
References: <20261118123933.74517-1-dev@deq.rocks>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 572954m:572954ap6fYNW:572954s9s1FY5vC9
X-smtpcorp-track: XINZUbQhdLHF.dqxMwpX2XUju.txT5SQBech2

Tested on a MacBookAir8,1 (BCM4355/12, firmware 9.30.503.0.32.5.87,
board_type apple,hawaii) with kernel 7.3.4-3-t2, replacing the t2linux
9006/9008 patches.

With TRACE enabled the driver logs "Skip ARP/ND offload enable on Apple
BCM4355" and configures ARP and ND offload to 0x0. With the firmware
console on, the "EL: 38 5890" errors stay at 0, idle and under a
6-stream download. Throughput after a fresh driver load is normal on
both IPv4 (260-301 Mbps) and IPv6 (248-336 Mbps); without the fix this
machine is stuck at ~50 Mbps right after boot.

Minor: the code comment says "IPv6 downloads drop", but on the BCM4355
IPv4 downloads drop too, as the commit message says.

Tested-by: Blaž Zupan <blaz@inlimbo.org>
