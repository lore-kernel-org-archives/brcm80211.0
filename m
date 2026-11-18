Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995908;
	b=E55Ch2Vl+q8NFBJtmIZf73TmUgw0DssNj5vNLGS4V5Nyij/EdQQJuevbAa5W5ktxdVEH
	 ciP3TfYL16A4Bw9ZUtE/hF+oz3lOgzwdFmgrClKRCLfZM5Ky4s6+qOr6hXSakBM9l1bj0
	 O2wldcYA9kxYcgYMBkwjARJLQHMDSmTMC/npBwUjQr9m80pzkCNwO0xfltGYcVO2/6mTB
	 +czIpxvav+4EkdDw063l8c1ugYLLbkH4RT3YTyY+Ibk03A/drTEPbjf4HxD3d1HCxNUZq
	 xH6uOgP8/7JbkJDaIs5tyTMlFFTZeJMJNZEiW9im3Yife1yh44zQnIoKOhE1KQwqoOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995908;
	h=DMARC-Filter:Date:X-Lima-ML-UUID:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=jcs67+Lv+U9upOUf4i1JrBoRc0VrRzju4wtU72Tt0uo=;
	b=u25FHDWF8exijKe3WMq4SlmI/78lzIqkfJIXXQ+PqwLll0lM4Ieje3Lf6xB2rzlMDkrd
	 BorKWdAguT5w9xr/YvdQM4paVn1jSN+0BrorF51T6/Eqp93vHEufz12tNeK7FD68LBAr9
	 pWyQarirZj2/98SEPPLyu1I+xKvdDjHlO4MUPHUzn5VKn9TU+rqXL3MXyj7TpjnxVtYqR
	 s3dVFPkRsiN2ruN6JYdNcE+QtNS6rWYNOb0G7JCgPfFXKmjGes6Nxwc42RvYv9ZyjAOqs
	 9NPXZeb7cv3DpzC1CtymigerVi4BIM9ZhLf1MprctrZpmi5iVPlCpGQbZvgaI0962Ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=b8ruWdf1;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4F2606A32F
	for <brcm80211@lists.linux.dev>; Wed, 18 Nov 2026 09:58:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF4F2606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=b8ruWdf1
Date: Wed, 18 Nov 2026 10:42:04 +0100
X-Lima-ML-UUID: e48ff96b-0f23-405e-b3e9-272f618e95ab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794995899;
	bh=jcs67+Lv+U9upOUf4i1JrBoRc0VrRzju4wtU72Tt0uo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=b8ruWdf1TRi2fFxA/guW7LfgkkkYoNBZ9wE+VBDdIO35Tl02BfCBP7yNDq91ZhEh1
	 FpIUGwEsuXayrj4cJ1io+NOy8PnHoooHrtSbNpvan1WPEM4I76XBY9JSiS0aRiaQGo
	 PdM6Z0AJFslSYK82z/s4qzQCgxDO6PhkUjwyg5uIfDwKKBWEHywkObZbsOTHtYcVdi
	 i/tF3Xp0Fn7jGQKPcTGkLJvje7UApILifVyWZRHG/lBE10ZJfhZ5Uxd2kKUwm6L3mh
	 XfpWj36ZOCA2vlVsOtZo1Sb+mnwV+qsDJCnCNwE7zlhtdVzkCQTAl+JugYhgTEt/wF
	 Xr0OXgnF0krQQ==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org, Yossef
 Osman <Yossef.Osman@proton.me>, Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH] wifi: brcmfmac: keep ARP and ND offload off on the
 BCM4364
Message-ID: <20261118104049.39e4d3a2@kait2en-mbp15-1>
In-Reply-To: <20261116203719.281605-1-arend.vanspriel@broadcom.com>
References: <20261104151620.70671-1-dev@deq.rocks>
	<20261116203719.281605-1-arend.vanspriel@broadcom.com>
Organization: KaiT2en
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Nov 2026 21:37:17 +0100
Arend van Spriel <arend.vanspriel@broadcom.com> wrote:

> 1) The measurements only implicate ndoe. Do you have data showing
> arpoe also needs to be off? Otherwise please limit this to ND offload.

Well, scratching my head here as well. The throughput drop is ND alone,
with only ND offload off the MacBookPro 15,1 reaches the full 120 Mbit/s
as well. I keep ARP offload off anyway because that is how macOS runs
this firmware. The macOS trace shows arpoe, nd_hostip_clear and ndoe
set to 0 together on wake, and both offloads are only enabled on entry
to associated sleep. Apple checks emails, Siri and whatnots on sleep.I
can't look into the firmware, and with ARP offload on while awake we
would run it in a configuration Apple does not use. With both off it
has run on the community machines for weeks without problems.We can
enable it but may require another few weeks until we can confirm it's
stable.

> 2) [...] Please restrict the quirk to the affected platform, e.g. with
> the Apple board type (settings->board_type) [...] The same applies to
> the other chip ID quirks of this batch (txbf and FWAUTH).

Will do!

> 3) This looks like a bug fix. Please add a Fixes: tag and Cc: stable
> (as Aditya suggested), and mark the target tree in the subject.

Yes, v2 goes to wireless with both.

Andre
